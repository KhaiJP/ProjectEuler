def main() -> None:
    S: set = set()
    for a in range(2, 101):
        for b in range(2,101):
            S.add(a**b)

    print(len(S))
    return


if __name__ == '__main__':
    main()
