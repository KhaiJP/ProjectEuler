def main() -> None:
    upper_limit: int = 4000000
    answer: int = 0
    Fib_2: int = 1
    Fib_1: int = 2
    while True:
        Fib: int = Fib_1 + Fib_2
        if Fib > upper_limit: break
        if (Fib&1) == 0: answer += Fib
        Fib_2, Fib_1 = Fib_1, Fib

    print(answer)

    return


if __name__ == '__main__':
    main()

