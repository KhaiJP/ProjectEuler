def Lychrel_process(n: int) -> int:
    s = str(n)
    s = s[::-1]
    m = int(s)
    return n + m


def is_palindrome(n: int) -> bool:
    s = str(n)
    l = len(s)
    for i in range(l//2):
        if s[i] != s[l - 1 - i]:
            return False
    
    return True


def is_Lychrel(n: int, cnt: int = 0) -> bool:
    cnt += 1
    if 50 <= cnt:
        return True
    
    next_n = Lychrel_process(n)
    if is_palindrome(next_n):
        return False
    
    return is_Lychrel(next_n, cnt)


def main() -> int:
    upper_limit = 10**4
    filterd = list(filter(is_Lychrel, range(1, upper_limit)))
    return len(filterd)


if __name__ == "__main__":
    answer = main()
    print(answer)
