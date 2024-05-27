import time


def to_str_bin(n: int) -> str:
    return f'{n:b}'


def is_palindrome(n: int, format: callable) -> bool:
    s = list(format(n))
    t = list(format(n))
    t.reverse()
    return s == t


def both_palindrome(n: int) -> bool:
    return is_palindrome(n, str) and is_palindrome(n, to_str_bin)


def main() -> int:
    upper_limit = 10**6
    answer = sum(n for n in range(upper_limit) if both_palindrome(n))
    return answer


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
