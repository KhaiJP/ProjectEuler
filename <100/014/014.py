UPPER_LIMIT: int = 10**6
cnt = [0 for _ in range(10**6+10)]


def Collatz(n: int) -> int:
    c = 0
    m = n

    while True:
        if m < UPPER_LIMIT and cnt[m] > 0:
            c += cnt[m]
            break
        c += 1

        if m%2 == 0:
            m = m // 2
        else:
            m = 3*m + 1
    cnt[n] = c

    return c

def main() -> None:
    chain_l: int = 0
    answer: int  = 0
    cnt[1] = 1

    for j in range(1, UPPER_LIMIT):
        c = Collatz(j)
        if chain_l < c:
            chain_l = c
            answer = j

    print(answer)

    return


if __name__ == '__main__':
    main()

