def main() -> None:
    # the Fibonacci seq diverges O(1.6^n) (1.6 is rough value of the golden ratio).
    # log10(1.6) ~ 0.2 -> Fibonacci would achieve 1000-digits around 5000, at least no greater than 100,000
    target_digit, max_loop = 1000, 10**5

    Fib_1, Fib_2 = 1, 1
    for n in range(3, max_loop+1):
        Fib_3 = Fib_2 + Fib_1
        l: int = len(str(Fib_3))
        if l >= target_digit:
            print(n)
            return
        Fib_1, Fib_2 = Fib_2, Fib_3


if __name__ == '__main__':
    main()
