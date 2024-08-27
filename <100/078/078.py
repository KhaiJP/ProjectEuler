def pentagonal_prod(n: int) -> int:
    return n * (3*n - 1) // 2


def partition(n: int, memo: list[int]) -> int:
    val = 0
    sufficiently_big_num = 10**9
    for i in range(1, sufficiently_big_num):
        coeff = -1 if i%2 == 0 else 1
        k = pentagonal_prod(i)
        if n-k < 0:
            memo[n] = val
            return memo[n]
        val = (val + coeff * memo[n-k]) % (10**6)

        k = pentagonal_prod(-i)
        if n-k < 0:
            memo[n] = val
            return memo[n]
        val = (val + coeff * memo[n-k]) % (10**6)


def main() -> int:
    memo = [0 for _ in range(100000)]
    memo[0] = 1
    for n in range(1, 100000):
        if partition(n, memo) == 0:
            return n
    
    return -1


if __name__ == "__main__":
    answer = main()
    print(answer)
