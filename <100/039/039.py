import math


def pythagoreanGenerator(m: int, n: int) -> tuple[int, int, int]:
    """
    if gcd(m, n) == 1, then returns Pythagorean triple (a, b, c) = (m^2-n^2, 2mn, m^2+n^2)
    else returns (0, 0, 0)
    """
    if math.gcd(m, n) == 1:
        return (m**2 - n**2, 2*m*n, m**2 + n**2)
    else:
        return (0, 0, 0)


def perimeter(triangle: tuple[int, int, int]) -> int:
    """
    returns the perimeter of triangle (a, b, c)
    """
    (a, b, c) = triangle
    return a + b + c


def main() -> int:
    upper_limit = 1000
    memo : dict[int, int] = {j: 0 for j in range(1, upper_limit+1)}
    for n in range(1, upper_limit//2):
        for m in range((n+1), upper_limit//2+1):
            if math.gcd(m, n) != 1 or m%2 == n%2:
                continue
            triangle = pythagoreanGenerator(m, n)
            p = perimeter(triangle=triangle)
            var_p = p
            while var_p <= upper_limit:
                memo[var_p] += 1
                var_p += p
    answer = 0
    ref_count = 0
    for p in range(1, upper_limit+1):
        count = memo[p]
        if ref_count <= count:
            ref_count = count
            answer = p

    return answer


if __name__ == "__main__":
    answer = main()
    print(answer)
