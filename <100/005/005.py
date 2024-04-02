import sympy


def main() -> None:
    l = [j for j in range(1, 21)]
    pfl: list[dict] = map(sympy.factorint, l)
    
    # key: prime factor, value: max power of the key appear in range(1, 21)
    m = {}

    for d in pfl:
        for key in d:
            if key in m:
                m[key] = max(m[key], d[key])
            else:
                m[key] = d[key]

    answer: int = 1
    for prime, power in m.items():
        answer *= prime**power

    print(answer)

    return


if __name__ == '__main__':
    main()

