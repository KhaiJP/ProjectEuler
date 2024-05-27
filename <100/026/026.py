import time


def get_period(n: int) -> int:
    r = 10
    s = set([r])
    num_loop = 0
    max_loop = 1000
    while num_loop < max_loop:
        num_loop += 1
        r = (r%n) * 10

        if r == 0 or r in s:
            return num_loop
        
        s.add(r)
    
    return -1


def main() -> int:
    upper_limit: int = 1000
    periods = map(lambda n: (get_period(n), n), range(2,upper_limit))
    answer  = max(periods)[1]
    
    return answer


if __name__ == "__main__":
    start = time.time()
    answer = main()
    elapsed = time.time() - start

    print(f'{elapsed} sec')
    print(answer)
