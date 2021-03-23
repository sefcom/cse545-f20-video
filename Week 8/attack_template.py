#!/usr/bin/python3
# ./attack.py GDB RECORD NOASLR
from pwn import process, gdb, args, p64

binary = './test'

gs = """
break main
continue
"""


def main():
    if args.GDB:
        p = gdb.debug(binary, gdbscript=gs)
    else:
        p = process(binary)

    attack = b'attack'

    if args.RECORD:
        with open("input", "wb") as f:
            f.write(attack)

    p.send(attack)

    # Make sure that this is kept for gdb
    p.interactive()


if __name__ == "__main__":
    main()
