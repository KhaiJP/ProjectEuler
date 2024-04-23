import sympy
import time

def main() -> None:
    max_d: int = 12000
    answer = 0
    # this algorithm, naive brute-force, is slow for Python; it takes 6 mins to execute
    # whereas C++ takes only 1 sec for the same algorithm.
    for d in range(max_d, 2, -1):
        # n/d < 1/2  <==> n < d/2  ==> max_n = d/2 - 1 if d%2 == 0 else d/2.
        n: int = (d//2 - 1) if d%2 == 0 else (d//2)
        while 3*n > d:
            answer += 1 if sympy.gcd(n, d) == 1 else 0
            n -= 1
    
    print(answer)
    return


if __name__ == '__main__':
    start = time.time()
    main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
