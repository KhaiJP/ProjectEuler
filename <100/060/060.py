import sympy
import time
import sys
sys.setrecursionlimit(10**8)


def concat(n: int, m: int) -> int:
    sn = str(n)
    sm = str(m)
    return int(sn + sm)


def allPairsPrimes(l: list[int], p: int) -> bool:
    for q in l:
        pq = concat(p, q)
        if not sympy.isprime(pq):
            return False
        qp = concat(q, p)
        if not sympy.isprime(qp):
            return False

    return True


def dfs(l: list[int], temporal) -> int:
    if len(l) == 6:
        s = sum(l)
        return s
    
    p = l[-1]
    while True:
        p = sympy.nextprime(p)
        if p > 9999:
            return temporal
        if not allPairsPrimes(l[1:], p):
            continue
        
        l.append(p)
        temporal = min(temporal, dfs(l, temporal))
        l.pop()


def main() -> int:
    l = [0]
    temporal = 10**8
    temporal = dfs(l, temporal)

    return temporal


if __name__ == '__main__':
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
