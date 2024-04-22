import sympy
import sympy.ntheory.factor_ as factor
import numpy as np
import time


def arePermutes(n: int, m: int) -> bool:
    s = sorted(str(n))
    t = sorted(str(m))
    return s == t


def totientRate(n: int) -> sympy.core.numbers.Rational:
    phi = factor.totient(n)
    if arePermutes(n, phi):
        return n / phi
    else:
        return 10**7


def main() -> None:
    upper_limit = 10**7
    totientRates = np.array([totientRate(n) for n in range(2, upper_limit)])
    print(np.argmin(totientRates) + 2)

    return


if __name__ == '__main__':
    # this algorithm is slow for Python; it takes 3.5 mins to execute
    start = time.time()
    main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
