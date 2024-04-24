from sympy.ntheory.continued_fraction import continued_fraction
from sympy import sqrt
import time


def main() -> None:
    upper_limit: int = 10**4+1

    f         = lambda n: len((continued_fraction(sqrt(n))+[])[-1])
    isSquared = lambda n: int(sqrt(n))**2 == n
    # sympy's continued_fractions is bit slow; it takes 1.5 mins to execute.
    answer = sum([ 1 for n in range(2, upper_limit) if not isSquared(n) and f(n)%2 == 1 ])
    print(answer)

    return


if __name__ == '__main__':
    start = time.time()
    main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
