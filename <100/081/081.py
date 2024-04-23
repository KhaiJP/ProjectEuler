def readfile(filename: str) -> list[list[int]]:
    l = []
    with open(filename, 'r') as f:
        r = f.readline()
        rows = r.split(' ')
        for row in rows:
            row_ = [int(s) for s in row.split(',')]
            l.append(row_)
    
    return l


def main() -> None:
    filename: str = "081.txt"
    V  = readfile(filename)    
    H  = len(V)
    W  = len(V[0])
    dp = [[10**9 for _ in range(W)] for __ in range(H)]
    dp[0][0] = V[0][0]

    for h in range(H):
        for w in range(W):
            if w + 1 < W:
                dp[h][w+1] = min(dp[h][w+1], dp[h][w] + V[h][w+1])
            if h + 1 < H:
                dp[h+1][w] = min(dp[h+1][w], dp[h][w] + V[h+1][w])

    print(dp[H-1][W-1])
    return


if __name__ == '__main__':
    main()
