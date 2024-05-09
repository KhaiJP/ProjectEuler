from typing import Callable
import time


def pentagonal_prod(n: int) -> int:
    return n * (3*n - 1) // 2


def lower_bound_inverse(smaller: int,
                        bigger: int,
                        f: Callable,
                        target: int) -> int:
    if bigger - smaller == 1:
        return smaller

    mid: int = (bigger + smaller) // 2
    fmid: int = f(mid)
    if fmid <= target:
        return lower_bound_inverse(mid, bigger, f, target)
    else:
        return lower_bound_inverse(smaller, mid, f, target)


def has_inverse(f: Callable,
                target: int
                ) -> bool:
    lb = lower_bound_inverse(0, 10**9, f, target)
    return f(lb) == target


def is_pentagonal(target: int) -> bool:
    return has_inverse(pentagonal_prod, target)


def main() -> int:
    upper_limit: int = 10**4
    answer = 10**9
    for k in range(2, upper_limit):
        for j in range(k-1, 0, -1):
            pk = pentagonal_prod(k)
            pj = pentagonal_prod(j)
            sum_ = pk + pj
            diff = pk - pj
            if answer < diff:
                break
            if is_pentagonal(diff) and is_pentagonal(sum_):
                print(k, j)
                answer = diff
                break

    return answer


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
