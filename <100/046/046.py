import sympy


def enjoyGBconjecture(n: int) -> bool:
    for j in range(1, 1000000):
        p = n - 2*j**2
        if p <= 1:
            return False
        if sympy.isprime(p):
            return True


def main() -> int:
    counterexamples = (n for n in range(35, 1000000, 2) if not sympy.isprime(n) and not enjoyGBconjecture(n))
    for counterexample in counterexamples:
        return counterexample
    print("no odd composite, up to 1000000, has been found that breaks GB conjecture")
    return -1


if __name__ == '__main__':
    answer = main()
    print(answer)
