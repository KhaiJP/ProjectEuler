import time
import sympy


def replace_digits(n: int, which: int, to: int) -> int:
    nl = list(str(n))
    ws = str(which)
    ts = str(to)

    f = lambda c: ts if c == ws else c
    nl_ = map(f, nl)
    s = "".join(nl_)
    if s[0] == '0':
        return -1
    return int(s)


def generate_replaceds(n: int, which: int) -> list[int]:
    return [replace_digits(n, which, to) for to in range(10)]


def is_ok(n: int, which: int) -> bool:
    l = generate_replaceds(n, which)
    filtered = list(filter(sympy.isprime, l))
    length = len(filtered)
    return length == 8


def main() -> int:
    upper_limit = 10**7
    for n in range(56004, upper_limit):
        for which in range(2):
            if is_ok(n, which):
                return n
    
    return -1


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
