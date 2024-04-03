num_digits = 13


def solve(s: str) -> int:
    N: int = len(s)
    m: int = 0
    for j in range(N-num_digits):
        tmp: int = 1
        for d in range(num_digits):
            tmp *= int(s[j+d])
        m = max(m, tmp)

    return m


def main() -> None:
    filename = "008.txt"
    s: str = ""
    with open(filename, 'r') as f:
        for row in f:
            if row[-1] == '\n':
                row = row[:-1]
            s += row

    print(solve(s))

    return


if __name__ == '__main__':
    main()

