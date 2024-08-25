def partition(n: int, k: int, memo: list[list[int]]) -> int:
    if n < k:
        return 0
    if n == k:
        memo[n][k] = 1
        return memo[n][k]
    if n < len(memo) and k < len(memo[0]) and 0 < memo[n][k]:
        return memo[n][k]
    
    nk1 = partition(n, k+1, memo)
    nkk = 0
    if 0 < k:
        nkk = partition(n-k, k, memo)
    
    memo[n][k] = nk1 + nkk
    return memo[n][k]


def main() -> int:
    memo = [[0 for _ in range(110)] for __ in range(110)]
    return partition(100, 1, memo) - 1


if __name__ == "__main__":
    answer = main()
    print(answer)
