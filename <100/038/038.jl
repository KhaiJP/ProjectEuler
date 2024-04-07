function is_pandigital(str:: String):: Bool
  S:: Set{Int} = Set([parse(Int, c) for c ∈ str])
  R:: Set{Int} = Set([n for n ∈ 1:9])
  return S == R
end

function eval_catProd(n:: Int):: Int
  tmp:: String = ""
  streak:: Int = 0
  while length(tmp) < 9
    streak += 1
    tmp *= (n*streak) |> string
  end
  if length(tmp) > 9 || streak == 1
    return -1
  end
  
  return tmp |> is_pandigital ? parse(Int, tmp) : -1
end

function main():: Nothing
  upper_limit:: Int = 9876
  answer:: Int = 0

  for n ∈ 1:upper_limit
    answer = max(answer, eval_catProd(n))
  end

  answer |> println
  return nothing
end


@time main()