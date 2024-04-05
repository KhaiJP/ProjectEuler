function main():: Nothing
  target:: Int = 200
  dp:: Array{Int} = zeros(Int, target+10)
  coins:: Array{Int} = [1, 2, 5, 10, 20, 50, 100, 200]

  dp[begin] = 1
  for coin ∈ coins
    for m ∈ 0:target
      nm:: Int = m + coin
      if nm > target continue end
      dp[begin + nm] += dp[begin + m]
    end
  end

  dp[begin + target] |> println
end

main()