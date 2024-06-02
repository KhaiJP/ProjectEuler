import sympy


def is_pandigital(n: int) -> bool:
    ref = ['1', '2', '3', '4', '5', '6', '7']
    s = sorted(str(n))
    return s == ref[:len(s)]


def main() -> int:
    upper_limit = 7654321
    answers = (p for p in range(upper_limit, 0, -1) if sympy.isprime(p) and is_pandigital(p))
    for answer in answers:
        return answer
    return -1


if __name__ == '__main__':
    answer = main()
    print(answer)
