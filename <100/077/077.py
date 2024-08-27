from sympy import isprime


def partition(n: int, k: int, memo: list[list[int]]) -> int:
    if n == 0: return 1
    if k == 0: return 0
    if 0 < memo[n][k]: return memo[n][k]

    a: int = partition(n, k-1, memo)
    b: int = partition(n-k, k, memo) if isprime(k) and k <= n else 0

    memo[n][k] = a + b
    return memo[n][k]


def achieved_target(n: int, memo: list[list[int]]) -> bool:
    target = 5000
    p = partition(n, n, memo)
    return target < p


def main() -> int:
    upper_limit: int = 200
    memo: list[list[int]] = [[0 for _ in range(upper_limit+10)] for __ in range(upper_limit+10)]

    for n in range(2, upper_limit):
        if achieved_target(n, memo):
            return n

    return -1


if __name__ == "__main__":
    answer = main()
    print(answer)
