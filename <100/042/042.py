from collections.abc import Generator
import math
import time


def transform(word: str) -> int:
    char_values: list[int] = [ord(c)-ord('A')+1 for c in word]
    s: int = sum(char_values)

    return s


def is_triangle(n: int) -> bool:
    '''
    n is a triagle number if and only if sqrt(8n+1) is integer
    if you can naively ignore the effect of machine epsilon, evaluating sqrt is quite simple.
    if not, "trial division" or "binary search" would be the top alternatives.
    the former is, in general, the easiest way but slower, and the latter is still easy and faster
    '''
    # naive way
    # return math.sqrt(8*n+1).is_integer()

    N: int = 8*n+1
    # trial division.
    # slower but as fast as binary search in Project Euler 042 as max(N) ~ 1000
    for j in range(1, N+1):
        if j**2 > N: return False
        if j**2 == N: return True
    
    # binary search
    # bigger: int  = N
    # smaller: int = 0
    # while bigger - smaller > 1:
    #     mid = (bigger + smaller) // 2
    #     if mid**2 >= N: bigger  = mid
    #     else:           smaller = mid
    
    # return bigger**2 == N


def main() -> None:
    filename = "042.txt"
    with open(filename, 'r') as f:
        line = f.readline()
    
    line_list =line.split(',')
    words: Generator[str] = (word[1:-1] for word in line_list)
    values: Generator[int] = (transform(word) for word in words)
    triangle_values: Generator[bool] = (is_triangle(value) for value in values)

    start = time.time()
    answer: int = sum(triangle_values) # True is equiv to 1 and False is equiv to 0
    elapsed = time.time() - start
    print(answer, elapsed)
    return


if __name__ == '__main__':
    main()
