dp = [[0 for _ in range(25)] for __ in range(25)]


def main() -> None:
    dp[0][0] = 1
    for i in range(21):
        for j in range(21):
            dp[i+1][j] += dp[i][j]
            dp[i][j+1] += dp[i][j]

    print(dp[20][20])

    return


if __name__ == '__main__':
    main()

