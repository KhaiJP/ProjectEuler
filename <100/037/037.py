import sympy
import time


def clip_left(n: int) -> int:
    ord     = len(str(n))-1
    divisor = 10**ord
    return n % divisor


def clip_right(n: int) -> int:
    return n // 10


def truncatable(n: int, direc: int) -> bool:
    while n > 0:
        if not sympy.isprime(n):
            return False
        n = direc(n)

    return True


def both_truncatable(n: int) -> bool:
    return truncatable(n, clip_right) and truncatable(n, clip_left)


def main():
    upper_limit: int = 10**6
    primes  = sympy.primerange(10,upper_limit)
    propers = list(filter(both_truncatable, primes))
    if len(propers) < 11:
        return -1
    else:
        return sum(propers[:11])


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
