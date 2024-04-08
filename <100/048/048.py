import sys


sys.setrecursionlimit(2000)
mod = 10**10


def naive_pow(base: int, power: int) -> int:
    if power == 1: return base % mod
    return base * naive_pow(base, power-1) % mod


def main() -> None:
    answer: int = 0
    for i in range(1, 1001):
        answer = (answer + naive_pow(i, i)) % mod

    print(answer)
    return


if __name__ == '__main__':
    main()
