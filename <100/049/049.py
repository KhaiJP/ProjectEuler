import sympy


def arePerms(n: int, m: int) -> bool:
    ln = sorted(str(n))
    lm = sorted(str(m))
    return ln == lm


def main() -> str:
    upper_limit = 10000
    for p1 in range(1489, upper_limit, 2):
        if not sympy.isprime(p1):
            continue
        for p2 in range(p1+2, upper_limit, 2):
            if not sympy.isprime(p2) or not arePerms(p1, p2):
                continue
            gap = p2 - p1
            p3  = p2 + gap
            if sympy.isprime(p3) and arePerms(p3, p1):
                return str(p1) + str(p2) + str(p3)
    
    return "not found"


if __name__ == '__main__':
    answer = main()
    print(answer)
