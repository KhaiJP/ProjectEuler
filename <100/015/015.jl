function solve(height :: Integer, width :: Integer) :: Integer
  dp :: Matrix{Integer} = zeros(height+2, width+2)
  dp[begin, begin] = 1
  for i ∈ 0:height
    for j ∈ 0:width
      dp[begin + i + 1, begin + j] += dp[begin + i, begin + j]
      dp[begin + i, begin + j + 1] += dp[begin + i, begin + j]
    end
  end

  return dp[begin + height, begin + width]
end


function main() :: Nothing
  solve(20, 20) |> println
  return nothing
end


@time main()
