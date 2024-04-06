function distribute_digits(n:: Int):: Array{Int}
  s = n |> string
  l:: Array{Int} = [parse(Int, c) for c ∈ s]
  return l
end

function is_ok(n:: Int):: Bool
  l:: Array{Int} = [parse(Int, c) for c ∈ (n |> string)]
  l_factorial:: Array{Int} = map(x -> factorial(x), l)
  s:: Int = l_factorial |> sum

  return s == n
end

function main():: Nothing
  answer:: Int = 0
  upper_limit:: Int = 10^7

  for i ∈ 10:upper_limit
    if i |> is_ok
      answer += i
    end
  end

  answer |> println
  return nothing
end

@time main()
