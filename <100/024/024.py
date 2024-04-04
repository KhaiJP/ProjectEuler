import itertools


def main() -> None:
    S: str = "0123456789"
    iters = itertools.permutations(S)
    for j, item in enumerate(iters):
        if j == 10**6 - 1:
            answer = ''.join(item)
            print(answer)
            return


if __name__ == '__main__':
    main()

