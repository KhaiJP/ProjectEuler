def to_sorted_string(n: int) -> str:
    s = str(n)
    return "".join(sorted(s))


def is_ok(x: int) -> bool:
    s = to_sorted_string(x)
    for i in range(2, 7):
        t = to_sorted_string(i*x)
        if t != s:
            return False

    return True


def main() -> int:
    for n in range(125875, 10**8):
        if is_ok(n):
            return n

    return -1


if __name__ == "__main__":
    answer = main()
    print(answer)

