def isPalindrome(n: int) -> bool:
    s = str(n)
    t = s[::-1]

    return s == t


def main() -> None:
    answer: int = 0
    for i in range(100, 1000):
        for j in range(100, 1000):
            n = i * j
            if not isPalindrome(n):
                continue
            if answer < n:
                answer = n

    print(answer)


if __name__ == '__main__':
    main()

