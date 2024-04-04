from datetime import date


def main() -> None:
    answer: int = 0
    for Y in range(1901, 2001):
        for M in range(1, 13):
            if date(Y, M, 1).weekday() == 6:
                answer += 1

    print(answer)
    return


if __name__ == '__main__':
    main()

