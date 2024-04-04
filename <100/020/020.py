import math


def main() -> None:
    n = math.factorial(100)
    l = [int(c) for c in str(n)]
    answer = sum(l)

    print(answer)
    return


if __name__ == '__main__':
    main()

