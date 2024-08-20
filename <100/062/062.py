def sort_str(s: str) -> str:
    l = sorted(s)
    return "".join(l)


def solve(upper_limit: int) -> int:
    count_memo: dict[str, int] = {}
    minimum_memo: dict[str, int] = {}
    for i in range(346, upper_limit):
        cubed = i**3
        s = str(cubed)
        s = sort_str(s)
        if s in count_memo:
            count_memo[s] += 1
        else:
            count_memo[s] = 1
            minimum_memo[s] = cubed
    
    good_vals = [minimum_val for minimum_val, count in zip(minimum_memo.values(), count_memo.values()) if count == 5]
    return min(good_vals)


def main() -> int:
    upper_limit = 10**5
    answer = solve(upper_limit)
    return answer


if __name__ == "__main__":
    answer = main()
    print(answer)
