import math

def digit_factorial_sum(n: int) -> int:
    return sum(math.factorial(int(c)) for c in str(n))


def solve(upper_limit: int) -> int:
    memo = {}
    count = 0
    for i in range(1, upper_limit):
        s = set([])
        while i not in s:
            s.add(i)
            i = digit_factorial_sum(i)
        if len(s) == 60:
            count += 1
    return count


def main() -> int:
    upper_limit = 10**6
    return solve(upper_limit)


if __name__ == "__main__":
    answer = main()
    print(answer)
