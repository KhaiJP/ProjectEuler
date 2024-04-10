import sympy

# see <100/028/028.md for the meanings of b, c, d.
# naming lambda function is not recommended in PEP8
b = lambda n: 4*n**2 + 2*n + 1
c = lambda n: 4*n**2       + 1
d = lambda n: 4*n**2 - 2*n + 1
side_length = lambda n: 2*n + 1
cnt_primes = lambda n: sum([sympy.isprime(b(n)), sympy.isprime(c(n)), sympy.isprime(d(n))])


def main() -> None:
    upper_limit: int = 10**6
    num_primes: int  = 0
    num_total: int   = 1
    for n in range(1, upper_limit):
        num_total += 4
        num_primes += cnt_primes(n)
        if 10 * num_primes < num_total:
            print(side_length(n))
            return


if __name__ == '__main__':
    main()
