import sympy
import time


def rotate(n: int) -> int:
    ord = len(str(n)) - 1
    lsd = n % 10
    n   = n // 10 + lsd * 10**ord

    return n


def rotates(n: int) -> list[int]:
    ord       = len(str(n))
    rotations = [0 for _ in range(ord)]
    for j in range(ord):
        n = rotate(n)
        rotations[j] = n
    
    return rotations


def all_rotations_primes(n: int) -> bool:
    rotations = rotates(n)
    bools = map(sympy.isprime, rotations)
    return all(bools)


def main() -> int:
    upper_limit = 10**6
    primes = sympy.primerange(upper_limit)
    bools  = map(all_rotations_primes, primes)
    answer = sum(bools)
    return answer


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
