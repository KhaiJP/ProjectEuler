import sympy


def main() -> None:
    target: int = 600851475143
    pfs = sympy.primefactors(target)
    print(pfs[-1])

    return


if __name__ == '__main__':
    main()

