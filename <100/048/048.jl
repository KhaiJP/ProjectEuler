function solve(mod:: Int):: Int
  answer:: Int = 0
  for j ∈ 1:10^3
    J:: BigInt = big(j)
    r:: Int = J^J % mod
    answer = (answer + r) % mod
  end

  return answer
end


function main():: Nothing
  mod:: Int = 10^10
  mod |> solve |> println

  return nothing
end


@time main()
