import math

def primitivePythagoreanGenerator(n: int, m: int) -> tuple[int, int, int]:
    if n <= m or math.gcd(n, m) > 1 or n%2 == m%2:
        return (-1, -1, -1)
    
    a, b, c = n**2 - m**2, 2*n*m, n**2 + m**2
    if b < a:
        a, b = b, a
    
    return (a, b, c)


def main() -> int:
    max_L = 1500000
    counts = [0 for _ in range(max_L+1)]
    for n in range(2, max_L):
        if max_L <= n*n:
            break
        for m in range(1, n):
            (a, b, c) = primitivePythagoreanGenerator(n, m)
            if a < 0:
                continue
            L = a + b + c
            buf = L
            while L <= max_L:
                counts[L] += 1
                L += buf
    
    filtered = filter(lambda x: x == 1, counts)
    return len(list(filtered))


if __name__ == "__main__":
    answer = main()
    print(answer)
