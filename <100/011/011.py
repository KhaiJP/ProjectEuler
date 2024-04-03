L = 4
H = 20
W = 20


def solve(F: list[list[int]]) -> int:
    DR = [-1, 0, 1, 1]
    DC = [ 1, 1, 1, 0]
    answer: int = 0

    for r in range(H):
        for c in range(W):
            for k in range(4):
                max_r, max_c = r+(L-1)*DR[k], c+(L-1)*DC[k]
                if max_r < 0:  continue
                if max_c < 0:  continue
                if max_r >= H: continue
                if max_c >= W: continue
                tmp: int = 1
                for d in range(L):
                    r_, c_ = r+d*DR[k], c+d*DC[k]
                    tmp *= F[r_][c_]
                answer = max(answer, tmp)

    return answer


def main() -> None:
    filename = "011.txt"
    F = []
    with open(filename, 'r') as f:
        for row in f:
            if row[-1] == '\n':
                row = row[: -1]
            row_list = [int(c) for c in row.split(' ')]
            F.append(row_list)

    print(solve(F))

    return


if __name__ == '__main__':
    main()

