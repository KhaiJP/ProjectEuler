import sympy
from typing import Callable


def quadraticGenerator(a: int, b: int) -> Callable[[int], int]:
    return lambda n: n**2 + a*n + b


def findLength(f: Callable[[int], int]) -> int:
    # sufficiently big number
    upper_limit = 10**8
    for n in range(upper_limit):
        if not sympy.isprime(f(n)):
            return n
    return -1


def primeLength(a: int, b: int) -> int:
    f = quadraticGenerator(a, b)
    l = findLength(f)
    return l


def main() -> None:
    pairs  = ((primeLength(a, b), a*b) for a in range(-1000,1001) for b in range(-1000,1001))
    answer = sorted(pairs)[-1][1]
    print(answer)

    return


if __name__ == '__main__':
    main()
