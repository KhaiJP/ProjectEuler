from sympy.ntheory.continued_fraction import continued_fraction as cf
from sympy.ntheory.continued_fraction import continued_fraction_convergents as convergents
from sympy import sqrt, fraction
import time


def solvePellsEq(D: int) -> tuple[int, int]:
    cf_sqrt = cf(sqrt(D))
    # when D is square, cf_sqrt = [sqrt(D)] and then no solution
    if len(cf_sqrt) == 1: return (0, 0)
    
    if len(cf_sqrt[-1])%2 == 1:
        cf_approx = [cf_sqrt[0]] + cf_sqrt[1] + cf_sqrt[1][:-1]
    else:
        cf_approx = [cf_sqrt[0]] + cf_sqrt[1][:-1]
    
    itr = convergents(cf_approx)
    fractions = [fraction(next(itr)) for _ in cf_approx]
    return fractions[-1]


def main() -> int:
    answer: int = 0
    ref_x:  int = 0

    for D in range(2,1001):
        tp = solvePellsEq(D)
        x  = tp[0]
        if ref_x < x:
            answer = D
            ref_x  = x
    
    return answer


if __name__ == '__main__':
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(answer)
    print(f'{elapsed} sec')
