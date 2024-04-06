function main()
  # the Fibonacci seq diverges O(1.6^n) (1.6 is rough value of the golden ratio).
  # log10(1.6) ~ 0.2 -> Fibonacci would achieve 1000-digits around 5000, at least no greater than 100,000
  target_digit:: Int = 1000
  max_loop:: Int     = 10^5

  Fib_1:: BigInt = big(1)
  Fib_2:: BigInt = big(1)
  Fib_3:: BigInt = big(1)
  for n in 3:max_loop
    Fib_3 = Fib_2 + Fib_1
    l:: Int = Fib_3 |> string |> length
    if l >= target_digit
      n |> println
      return
    end

    Fib_1, Fib_2 = Fib_2, Fib_3
  end
end

@time main()
