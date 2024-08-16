from fractions import Fraction
from math import prod

def pseudo_reduction(pair: tuple[int, int]) -> Fraction:
    (ns, ds) = (str(pair[0]), str(pair[1]))
    if ns[0] == ds[0]:
        return Fraction(f"{ns[1]}/{ds[1]}") if ds[1] != '0' else Fraction(101, 100)
    if ns[0] == ds[1]:
        return Fraction(f"{ns[1]}/{ds[0]}") if ds[0] != '0' else Fraction(101, 100)
    if ns[1] == ds[0]:
        return Fraction(f"{ns[0]}/{ds[1]}") if ds[1] != '0' else Fraction(101, 100)
    if ns[1] == ds[1]:
        return Fraction(f"{ns[0]}/{ds[0]}") if ds[0] != '0' else Fraction(101, 100)
    
    return Fraction(101, 100)


def is_ok(pair: tuple[int, int]) -> bool:
    proper_frac = Fraction(*pair)
    pseudo_frac = pseudo_reduction(pair)
    return proper_frac == pseudo_frac


def main() -> int:
    n_d_pairs = [(n, d) for d in range(11, 100) for n in range(11, d) if d%10 != 0 or n%10 != 0]
    good_pairs = filter(is_ok, n_d_pairs)
    in_frac_form = map(lambda pair: Fraction(*pair), good_pairs)
    prod_frac = prod(in_frac_form)
    return prod_frac.denominator


if __name__ == "__main__":
    answer = main()
    print(answer)
