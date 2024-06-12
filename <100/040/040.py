import sys
sys.setrecursionlimit(10**8)


def get_d(n: int,
          q: list[int],
          l: int,
          ans: int
          ) -> int:
    if not q:
        return ans
    
    sn = str(n)
    sl = len(sn)
    bk = q[-1]
    if bk <= l + sl:
        q.pop()
        for i in range(sl):
            if l + i + 1 == bk:
                d = int(sn[i])
                return get_d(n+1, q, l+sl, d*ans)
    
    return get_d(n+1, q, l+sl, ans)


def main() -> int:
    q = [10**j for j in range(6, -1, -1)]
    return get_d(1, q, 0, 1)


if __name__ == '__main__':
    answer = main()
    print(answer)
