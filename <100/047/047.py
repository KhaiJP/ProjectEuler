from sympy.ntheory import factorint


def areGoodFour(n: int) -> bool:
    l = range(n, n+4)
    pFactors    = list(map(lambda n: factorint(n).keys(), l))
    areGoodLens = all(map(lambda pfs: len(pfs) == 4, pFactors))
    if not areGoodLens:
        return False

    tuples = set(map(lambda pfs: tuple(sorted(pfs)), pFactors))
    return len(tuples) == 4


def main() -> int:
    answers = (n for n in range(1, 10**6) if areGoodFour(n))
    for answer in answers:
        return answer


if __name__ == '__main__':
    answer = main()
    print(answer)
