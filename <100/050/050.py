import sympy
import time

def my_binary_search(i: int,
                     upper_limit: int,
                     pfx: list[int]
                     ) -> int:
    '''
    find the smallest index j such that satisfies pfx[i] - pfx[j] < upper_limit
    '''
    ok: int = i  # pfx[i] - pfx[i] = 0 is always smaller than the upper_limit 
    ng: int = -1 # dummy number
    while abs(ok - ng) > 1: # this abs() is not necessary but make coding easier
        mid: int = (ok + ng) // 2
        if pfx[i]-pfx[mid] < upper_limit:
            ok = mid
        else:
            ng = mid

    return ok


def solve(upper_limit: int,
          pfx: list[int]
          ) -> int:

    answer: int         = 0
    longest_streak: int = 1
    L: int              = len(pfx)

    # checking from the top leads reducing of the number of loops
    for i in range(L-1, 0, -1):
        # the longest_streak with end point i is apparently i-0 = i -> check if i is worth examining
        if i < longest_streak: break
        
        # for any j < lower_limit, pfx[i] - pfx[j] >= upper_limit -> no need to examine
        lower_limit: int = my_binary_search(i, upper_limit, pfx)
        for j in range(lower_limit, i):
            # as j increases, streak i-j decreases
            tmp_streak: int = i - j
            if tmp_streak < longest_streak: break
            # eval difference delta which has to be prime
            delta: int = pfx[i] - pfx[j]
            if sympy.isprime(delta):
                answer = delta
                longest_streak = i - j
    
    return answer


def main() -> None:
    upper_limit: int = 10**6
    primes = list(sympy.primerange(2, upper_limit))

    # prefix sum; pfx[i] - pfx[j] = primes[j+1] + primes[j+2] + ... + primes[i]
    # if pfx[i] - pfx[j] is prime, the prime pfx[i]-pfx[j] is sum of i-j consecutive primes
    pfx = [0 for _ in range(len(primes) + 1)]
    for j in range(len(primes)):
        pfx[j+1] = pfx[j] + primes[j]

    answer: int = solve(upper_limit, pfx)
    print(answer)
    return


if __name__ == '__main__':
    start = time.time()
    main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
