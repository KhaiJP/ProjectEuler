def triangle(n: int) -> int: return n * (n+1) // 2
def pentagonal(n: int) -> int: return n * (3*n-1) // 2
def hexagonal(n: int) -> int: return n * (2*n-1)


def inverse(smaller: int,
            n: int,
            bigger: int,
            f: callable
            ) -> int:
    if smaller + 1 == bigger:
        return smaller
    mid = (smaller + bigger) // 2
    fm  = f(mid)
    if fm <= n: return inverse(mid, n, bigger, f)
    else:       return inverse(smaller, n, mid, f)


def has_inverse(n: int, f: callable) -> bool:
    smaller = 0
    bigger  = 10**9
    return n == f(inverse(smaller, n, bigger, f))
def is_triangle(n: int) -> bool: return has_inverse(n, triangle)
def is_pentagonal(n: int) -> bool: return has_inverse(n, pentagonal)


def main() -> int:
    answers = (hexagonal(n) for n in range(144, 1000000) if is_triangle(hexagonal(n)) and is_pentagonal(hexagonal(n)))
    for answer in answers:
        return answer
    return -1


if __name__ == '__main__':
    answer = main()
    print(answer)
