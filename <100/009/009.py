def main() -> None:
    upper_limit: int = 1000

    for a in range(1, upper_limit - 2):
        for b in range(a+1, upper_limit - 1):
            c = upper_limit - (a + b)
            if a*a + b*b == c*c:
                print(a*b*c)

                return


if __name__ == '__main__':
    main()

