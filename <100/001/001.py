def main() -> None:
    l = [j for j in range(1000) if j%3== 0 or j%5 ==0]
    s = sum(l)
    print(s)

    return


if __name__ == '__main__':
    main()

