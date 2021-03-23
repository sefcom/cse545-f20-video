from pwn import process


def main():
    r = process('./server.py')
    r.sendline("124")
    print(r.recvline())

    r.close()


if __name__ == "__main__":
    main()
