from collections.abc import Generator


# let us consider if there exists an upper limit of the number enjoying the condition.
# the maximum m-digit number is apprently m * 9^5 = 59049m bu< 60000m. to enjoy the condition,
# this number must be greater than or equal to 10^(m-1) (note 10^m is m+1-digit number).
# for m = 7, 60000m = 420,000 < 1,000,000 = 10^(m-1) -> m <= 6 -> no number greater than 360000 enjoy the condition.


power: int = 5
upper_limit: int = 360000

def is_ok(n: int) -> bool:
    l = [int(c)**power for c in list(str(n))]
    return sum(l) == n

def main() -> None:
    l: Generator[int]= (n for n in range(2, upper_limit) if is_ok(n))
    answer: int = sum(l)

    print(answer)
    return


if __name__ == '__main__':
    main()
