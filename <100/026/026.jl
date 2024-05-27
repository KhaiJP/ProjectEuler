function findPeriod(n:: Int):: Int
  return findPeriod_(1, Array{Int}([]), n)
end


function findPeriod_(n:: Int, rs:: Array{Int}, m:: Int):: Int
  r = n % m

  if r == 0
    return 0
  elseif r ∈ rs
    id = findfirst(x -> x == r, rs)
    cycle = []
    for j ∈ id:length(rs)
      push!(cycle, rs[j])
    end
    return cycle |> length
  else
    push!(rs, r)
    n = r*10
    return findPeriod_(n, rs, m)
  end
end


function main():: Nothing
  upper_limit:: Int = 999
  l = map(findPeriod, 1:upper_limit)
  l |> findmax |>  t->t[2] |> println

  return nothing
end


@time main()
