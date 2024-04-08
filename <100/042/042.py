from collections.abc import Generator
import math
import time


def open_to_list(filename: str) -> list[str]:
    with open(filename, 'r') as f:
        line = f.readline()
    words_list: list[str] = line.split(',')

    return words_list


def transform(word: str) -> int:
    char_values: list[int] = [ord(c)-ord('A')+1 for c in word]
    s: int = sum(char_values)

    return s


def is_triangle(n: int) -> bool:
    '''
    if you can naively ignore the effect of machine epsilon, evaluating sqrt is quite simple;
    n is a triagle number if and only if sqrt(8n+1) is integer.

    if not, "trial division" or "binary search" would be the top alternatives.
    the former is, in general, the easiest way but slower, and the latter is still easy and faster
    '''
    # naive way
    # return math.sqrt(8*n+1).is_integer()

    # trial division.
    # slower but as fast as binary search in Project Euler 042 as max(n) ~ 150
    for j in range(1, n+1):
        t: int = j*(j+1)//2
        if t == n: return True
        if t >  n: return False
    
    # binary search
    # bigger: int  = n+1
    # smaller: int = 0
    # while bigger - smaller > 1:
    #     mid = (bigger + smaller) // 2
    #     if mid*(mid+1)//2 >= n: bigger  = mid
    #     else:                   smaller = mid

    # return bigger * (bigger+1) // 2 == n 


def main() -> None:
    filename = "042.txt"
    file_contents: list[str]       = open_to_list(filename)
    words: Generator[str]          = (word[1:-1] for word in file_contents) # word[0] and word[-1] are open and close "
    values: Generator[int]         = (transform(word) for word in words)
    are_triangles: Generator[bool] = (is_triangle(value) for value in values)

    start = time.time()
    answer: int = sum(are_triangles) # True is equiv to 1 and False is equiv to 0
    elapsed = time.time() - start

    print(answer)
    print(f'{elapsed} sec')
    return


if __name__ == '__main__':
    main()
