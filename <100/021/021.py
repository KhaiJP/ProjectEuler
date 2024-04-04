import sympy


def main() -> None:
    upper_limit: int = 10**4
    answer: int = 0
    for n in range(2, upper_limit):
        dn  = sum(sympy.divisors(n)[:-1])
        ddn = sum(sympy.divisors(dn)[:-1])
        if ddn == n and dn != n:
            answer += n

    print(answer)
    return


if __name__ == '__main__':
    main()

