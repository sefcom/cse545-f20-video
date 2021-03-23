#!/usr/bin/python3.8
from pwn import *

elf = context.binary = ELF("./demo")


gs = """
break main
continue
"""


def start():
    if args.GDB:
        # return gdb.debug(elf.path)
        return gdb.debug(elf.path, gdbscript=gs)
    else:
        return process(elf.path)

io = start()
io.interactive()
