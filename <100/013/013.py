def main() -> None:
    filename = '013.txt'
    a: int = 0
    with open(filename, 'r') as f:
        for row in f:
            if row[-1] == '\n':
                row = row[:-1]
            a += int(row)

    answer = str(a)[:10]
    print(answer)

    return


if __name__ == '__main__':
    main()

