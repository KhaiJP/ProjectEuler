def area(m: int, n: int) -> int:
    tn = n * (n+1) // 2
    tm = m * (m+1) // 2
    return tn * tm


def main() -> int:
    minimum = 10**9
    target = 2 * 10**6
    answer = 1000000
    for m in range(1, 201):
        for n in range(m, 201):
            a = area(m, n)
            gap = abs(target - a)
            if gap < minimum:
                minimum = gap
                answer = m * n

    return answer


if __name__ == "__main__":
    answer = main()
    print(answer)
