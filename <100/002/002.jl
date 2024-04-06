function main():: Nothing
  Fib_2:: Int = 1
  Fib_1:: Int = 2
  Fib::Int = 0
  answer:: Int = Fib_1
  upper_limit:: Int = 4000000

  while true
    Fib = Fib_1 + Fib_2
    if Fib > upper_limit
      break
    end
    if Fib |> iseven
      answer += Fib
    end
    Fib_2, Fib_1 = Fib_1, Fib
  end
  
  answer |> println
  return nothing
end

@time main()
