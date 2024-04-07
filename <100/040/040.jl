function digit_push!(V:: Array{Int}, n:: Int):: Nothing
  # if n = 512 for example, execute push!(V, 5), push!(V, 1) and push!(V, 2)
  for c ∈ n |> string
    push!(V, parse(Int, c))
  end

  return nothing
end

function pre_process(upper_limit:: Int):; Array{Int}
  # create and return sequence d of the problem
  d:: Array{Int} = []
  for n ∈ 1:upper_limit
    digit_push!(d, n)
    if length(d) > upper_limit
      return d
    end
  end
end

function solve(d:: Array{Int}):: Int
  # calculate and return p = ∏_{j=0}^6 d_{10^j}   
  p:: Int = 1
  for j ∈ 0:6
    p *= d[10^j]
  end

  return p
end

function main():: Nothing
  upper_limit:: Int = 1000000
  upper_limit |> pre_process |> solve |> println

  return nothing
end


@time main()