def digit_sum(n : int) -> int:
    digits = (int(c) for c in str(n))
    return sum(digits)


def main() -> int:
    digit_sums = (digit_sum(a**b) for a in range(1, 100) for b in range(1, 100))
    answer = max(digit_sums)
    return answer


if __name__ == "__main__":
    answer = main()
    print(answer)
