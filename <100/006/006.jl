square(n:: Int):: Int = n^2
sum_linear(n:: Int):: Int = n * (n+1) ÷ 2
sum_square(n:: Int):: Int = n * (n+1) * (2n+1) ÷ 6

function  main():: Nothing
  sum_squared:: Int = 100 |> sum_linear |> square
  squared_sum:: Int = 100 |> sum_square
  diff:: Int =  sum_squared - squared_sum
  
  diff |> println
  return nothing
end


@time main()
