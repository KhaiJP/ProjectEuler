# consider patterns that a*b = c is pandigital. for the sake of simplist we write n-digit as n-d.
# 1 * 23456 = 23456, 9 * 234 = 2106-> 1-d * 5-d = 5-d or 6-d, 1-d * 3-d = 3-d or 4-d -> cannot be 1-9 pandigital.
# by doing the same analysis, pandigital set is 1-d * 4-d = 4-d or 2-d * 3-d = 4*d.
target: list[str] = list("123456789")
answer: int = 0
S: set = set()

def check(a: int, b: int, c: int) -> bool:
    s: str = str(a) + str(b) + str(c)
    s = sorted(s)
    return s == target


def main() -> None:
    for a in range(1,10):
        for b in range(1234, 10000):
            c = a * b
            if check(a, b, c):
                S.add(c)
    
    for a in range(12, 100):
        for b in range(123, 1000):
            c = a * b
            if check(a, b, c):
                S.add(c)
    
    answer = sum(S)
    print(answer)
    return


if __name__ == '__main__':
    main()
