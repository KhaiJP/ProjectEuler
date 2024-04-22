import sympy.ntheory.factor_ as factor
import numpy as np


def totientRate(n: int) -> float:
    return n / factor.totient(n)


def main() -> None:
    upper_limit = 10**6
    totientRates = np.array([totientRate(n) for n in range(1, upper_limit+1)])
    print(np.argmax(totientRates) + 1)

    return


if __name__ == '__main__':
    main()
