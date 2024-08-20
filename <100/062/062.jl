function sort_str(s :: String) :: String
  return s |> collect |> sort |> join
end


function solve(upper_limit :: Int) :: Int
  count_memo :: Dict{String, Int} = Dict()
  minimum_memo :: Dict{String, Int} = Dict()
  for i ∈ 346:upper_limit
    cubed = i^3
    s = cubed |> string |> sort_str
    if haskey(count_memo, s)
      count_memo[s] += 1
    else
      count_memo[s] = 1
      minimum_memo[s] = cubed
    end
  end

  good_vals = [minimum_val for (minimum_val, count) ∈ zip(values(minimum_memo), values(count_memo)) if count == 5]
  return minimum(good_vals)
end


function main() :: Nothing
  upper_limit = 10^4
  upper_limit |> solve |> println
end


@time main()
