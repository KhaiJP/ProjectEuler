import math

factorial_of = [math.factorial(i) for i in range(10)]

def is_ok(n: int) -> bool:
    l = [int(c) for c in list(str(n))]
    l_factorial = [factorial_of[a] for a in l]
    s = sum(l_factorial)

    return s == n


def main() -> None:
    answer: int = 0
    upper_limit: int = 10**7
    
    for i in range(10, upper_limit):
        if is_ok(i):
            answer += i

    print(answer)
    return


if __name__ == '__main__':
    main()
