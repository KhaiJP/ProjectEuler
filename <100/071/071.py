from fractions import Fraction
import math
import time


def main() -> int:
    upper_limit = 10**6
    l: list[Fraction] = []
    for d in range(9, upper_limit+1):
        n = 3 * d // 7
        while 1 < n and math.gcd(n, d) != 1:
            n -= 1
        if 0 < n:
            l.append(Fraction(n, d))
    
    l = sorted(l)
    return l[-1].numerator


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
