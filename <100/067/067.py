def main() -> None:
    filename = "067.txt"
    F: list[list] = []
    with open(filename, 'r') as f:
        for row in f:
            if row[-1] == '\n':
                row = row[:-1]
            r = [int(c) for c in row.split(' ')]
            F.append(r)
    H = len(F)

    dp = [[0 for _ in range(H)] for __ in range(H)]
    dp[0][0] = F[0][0]
    for r in range(H-1):
        for c in range(r+1):
            dp[r+1][c] = max(dp[r+1][c], dp[r][c] + F[r+1][c])
            dp[r+1][c+1] = max(dp[r+1][c+1], dp[r][c] + F[r+1][c+1])

    answer = max(dp[-1])
    print(answer)
    return


if __name__ == '__main__':
    main()

