def openfile(filename: str) -> list[int]:
    with open(filename, 'r') as f:
        s: str = f.readline()
    num_chars: list[str] = s.split(',')
    numbers = map(int, num_chars)

    return list(numbers)


def xor_s(numbers: list[int], keys: list[int]) -> str:
    nl = len(numbers)
    kl = len(keys)
    result = ['' for _ in range(nl)]
    for i in range(nl):
        result[i] = chr(numbers[i] ^ keys[i%kl] + ord('a'))
    
    return "".join(result)


def sum_message(message: str) -> int:
    return sum(ord(c) for c in message)


def solve(filename: str) -> int:
    numbers = openfile(filename)
    for k1 in range(26):
        for k2 in range(26):
            for k3 in range(26):
                message = xor_s(numbers, [k1, k2, k3])
                if "Euler" in message:
                    print(message)
                    return sum_message(message)
    return -1


def main() -> None:
    filename: str = "059.txt"
    answer = solve(filename)
    return answer


if __name__ == '__main__':
    answer = main()
    print(answer)
