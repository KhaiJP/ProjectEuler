def make_prod_cat_(base: str,
                  streak: int,
                  target: int
                  ) -> str:
    if len(base) >= 9:
        return base
    base += str(target*streak)
    return make_prod_cat_(base, streak+1, target)


def make_prod_cat(target: int) -> str:
    return make_prod_cat_("", 1, target)


def is_one_to_nine_pandigital(s: str) -> bool:
    target = list("123456789")
    s_ = sorted(s)
    return s_ == target


def main() -> None:
    answers = (make_prod_cat(n) for n in range(9876, 0, -1) if is_one_to_nine_pandigital(make_prod_cat(n)))
    for answer in answers:
        return int(answer)


if __name__ == "__main__":
    answer = main()
    print(answer)
