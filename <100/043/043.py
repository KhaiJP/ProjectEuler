import itertools
import time


def is_ok(t: tuple[int]) -> bool:
    if t[0] == '0': return False
    ref = [2, 3, 5, 7, 11, 13, 17]
    s = ''.join(t)
    return all(int(s[i+1:i+4])%p == 0 for i, p in enumerate(ref))


def main() -> int:
    answer = sum(int(''.join(t)) for t in itertools.permutations("0123456789") if is_ok(t))
    return answer


if __name__ == '__main__':
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(answer)
    print(f'{elapsed} sec')
