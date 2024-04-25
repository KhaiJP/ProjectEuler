from sympy.ntheory.continued_fraction import continued_fraction_iterator as itr_
from sympy.ntheory.continued_fraction import continued_fraction_convergents as convergents
from sympy import E, fraction
import time


def digit_sum(n: int) -> int:
    if(n == 0): return 0
    else:       return (n%10) + digit_sum(n//10) 


def main() -> int:
    itr = convergents(itr_(E))
    upper_limit = 100
    answer = 0
    fractions = [fraction(next(itr)) for _ in range(upper_limit)]
    answer = digit_sum(fractions[-1][0])

    return answer


if __name__ == '__main__':
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(answer)
    print(f'{elapsed} sec')
