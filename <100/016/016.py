def main() -> None:
    M: str = str(2**1000)
    L: geneartor = (int(c) for c in M)
    S: int = sum(L)
    print(S)

    return


if __name__ == '__main__':
    main()

