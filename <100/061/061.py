import itertools


def triangle_prod(n: int) -> int:
    return n * (n+1) // 2


def square_prod(n: int) -> int:
    return n * n


def pentagonal_prod(n: int) -> int:
    return n * (3*n-1) // 2


def hexagonal_prod(n: int) -> int:
    return n * (2*n-1)


def heptagonal_prod(n: int) -> int:
    return n * (5*n-3) // 2


def octagonal_prod(n: int) -> int:
    return n * (3*n-2)


def eval_geo_vect(f: callable) -> list[int]:
    return [f(n) for n in range(1,220) if 1000 <= f(n) and f(n) <= 9999]


def eval_geo_vects() -> list[list[int]]:
    fs = [triangle_prod, square_prod, pentagonal_prod, hexagonal_prod, heptagonal_prod, octagonal_prod]
    results = map(lambda f: eval_geo_vect(f), fs)
    return list(results)


def is_chain(pre: int, now: int) -> bool:
    if pre == 0:
        return True
    tail = pre % 100
    head = now // 100
    return tail == head


def dfs(v_idx: list[int],
        geo_vects: list[list[int]],
        chains: list[list[int]],
        chain: list[int],
        n: int = 0,
        pre: int = 0,
        ) -> None:
    if n == len(v_idx):
        if is_chain(chain[-1], chain[0]):
            tmp = [a for a in chain]
            chains.append(tmp)
        return
    
    gv = filter(lambda x: is_chain(pre, x), geo_vects[v_idx[n]])
    for a in gv:
        chain.append(a)
        dfs(v_idx, geo_vects, chains, chain, n+1, a)
        chain.pop(-1)


def main() -> int:
    geo_vects = eval_geo_vects()
    v_idx_ = [j for j in range(1, len(geo_vects))]
    chains = []

    perms = itertools.permutations(v_idx_)
    for perm in perms:
        v_idx = [0] + list(perm)
        chain  = []
        dfs(v_idx, geo_vects, chains, chain)

    answer = sum(sum(chain) for chain in chains)
    return answer


if __name__ == "__main__":
    answer = main()
    print(answer)
