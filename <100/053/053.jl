naiveCombo(n:: BigInt, r:: BigInt):: BigInt = factorial(n) ÷ (factorial(r) * factorial(n-r))
naiveCombo(n:: Int, r:: Int):: BigInt       = naiveCombo(big(n), big(r))

function naiveSolve(upper_limit:: Int):: Int
  target:: BigInt = 10^6
  flags = ( naiveCombo(n, r) > target for n ∈ 1:upper_limit for r ∈ 0:n )
  return flags |> sum
end

function main():: Nothing
  upper_limit:: Int = 100
  upper_limit |> naiveSolve |> println
  return nothing
end


@time main()
