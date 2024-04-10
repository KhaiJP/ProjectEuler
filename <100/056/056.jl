divideDigits(n:: BigInt):: Base.Generator     = (parse(Int, c) for c ∈ string(n))
powerDigitiSum(base:: Int, power:: Int):: Int = big(base)^big(power) |> divideDigits |> sum


function main():: Nothing
  max_ab:: Int = 99
  arr = (powerDigitiSum(a, b) for a ∈ 1:max_ab for b ∈ 1:max_ab)
  arr |> typeof |> println
  maximum(identity, arr) |> println
  return nothing
end


@time main()
