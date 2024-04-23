import sympy.ntheory.factor_ as factor
import time

def main() -> None:
    upper_limit: int = 10**6+1
    totients: list   = (factor.totient(n) for n in range(2, upper_limit))
    answer: int      = sum(totients)
    print(answer)

    return


if __name__ == '__main__':
    start = time.time()
    main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
