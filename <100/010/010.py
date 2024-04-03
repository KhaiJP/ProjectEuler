import sympy


def main() -> None:
    answer: int = 0
    for p in sympy.primerange(2, 2*10**6):
        answer += p

    print(answer)

    return


if __name__ == '__main__':
    main()

