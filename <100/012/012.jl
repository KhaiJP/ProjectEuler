using Primes


triangleProd(n:: Int):: Int = n * (n+1) ÷ 2

function main():: Nothing
  upper_limit:: Int = 10^6
  target::      Int = 500
  greaterThanTarget(n:: Int):: Bool = n >= target
  answers = (triangleProd(n) for n ∈ 1:upper_limit if triangleProd(n) |> divisors |> length |> greaterThanTarget)
  for answer ∈ answers
    answer |> println
    return nothing
  end

  message = "no triagnle number below " * string(upper_limit) * " has over " * string(target) * " divisors"
  message |> println
  return nothing 
end


@time main()