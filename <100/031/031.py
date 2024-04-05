def main() -> None:
    dp: list[int]    = [0 for _ in range(210)]
    coins: list[int] = [1, 2, 5, 10, 20, 50, 100, 200]
    target: int = 200

    dp[0] = 1
    for coin in coins:
        for m in range(target):
            nm: int = m + coin
            if nm > target: continue
            dp[nm] += dp[m]
    
    print(dp[target])
    return


if __name__ == '__main__':
    main()
