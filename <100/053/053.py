from scipy.special import comb
import time


def main() -> int:
    count : int = 0
    for n in range(1, 101):
        for r in range(0, n+1):
            if comb(n, r, exact=True) > 10**6:
                count += 1
    
    return count


if __name__ == '__main__':
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
