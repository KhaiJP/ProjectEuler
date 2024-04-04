def get_worth(name: str) -> int:
    alphabets = list(name)
    each_score = map(lambda c: ord(c) - ord('A') + 1, alphabets)
    s = sum(each_score)

    return s


def main() -> None:
    filename = "022.txt"
    with open(filename, 'r') as f:
        names : list[string] = []
        for row in f:
            if row[-1] == '\n':
                row = row[:-1]
                names = sorted(row.split(','))
                names = [name[1:-1] for name in names]
    name_scores = map(get_worth, names)
    scores = (ns * (i+1) for i, ns in enumerate(name_scores))

    answer = sum(scores)
    print(answer)
    return


if __name__ == '__main__':
    main()

