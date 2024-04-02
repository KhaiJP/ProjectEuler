def main() -> None:
    square_sum = sum((j**2 for j in range(1, 101)))
    sum_square = sum((j for j in range(1, 101))) ** 2
    answer = sum_square - square_sum

    print(answer)

    return


if __name__ == '__main__':
    main()

