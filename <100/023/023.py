import sympy
import itertools


def main() -> None:
    l: list = []
    for n in range(2, 28124):
        s: int = sum(sympy.divisors(n))
        if s > 2*n:
            l.append(n)
    S: set = set([j for j in range(1, 28124)])

    for a, b in itertools.combinations_with_replacement(l, 2):
        c: int = a + b
        S.discard(c)

    answer: int = sum(S)
    print(answer)
    return


if __name__ == '__main__':
    main()

