function digit_factorial_sum(n :: Int) :: Int
  result = 0
  while 0 < n
    result += factorial(n%10)
    n ÷= 10
  end
  return result
end


function solve(upper_limit :: Int) :: Int
  count = 0
  for i ∈ 1:(upper_limit)
    s :: Set{Int} = Set([])
    while !in(i, s)
      push!(s, i)
      i = digit_factorial_sum(i)
    end
    if length(s) == 60
      count += 1
    end
  end

  return count
end


function main() :: Nothing
  upper_limit :: Int = 10^6 - 1
  upper_limit |> solve |> println
end


@time main()
