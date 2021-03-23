from pwn import remote


def main():
    r = remote("localhost", 6000)
    r.sendline("hello")
    line = r.recvline()
    print(line)


if __name__ == "__main__":
    main()
