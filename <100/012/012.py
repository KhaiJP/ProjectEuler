import sympy


def main() -> None:
    THRESHOLD: int = 500
    for n in range(1, 10**6):
        m = n * (n+1) // 2
        if sympy.divisor_count(m) > THRESHOLD:
            print(m)

            return


if __name__ == '__main__':
    main()

