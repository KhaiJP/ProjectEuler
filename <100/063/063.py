def is_ok(a: int, p: int) -> bool:
    n = a**p
    l = len(str(n))
    return l == p


def main() -> int:
    answer = 0
    for a in range(1, 10):
        for p in range(1, 100):
            if is_ok(a, p):
                answer += 1
            else:
                break
    return answer


if __name__ == "__main__":
    answer = main()
    print(answer)
