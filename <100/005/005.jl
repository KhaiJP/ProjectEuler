function main():: Nothing
  answer:: Int = 1
  for n ∈ 20:-1:1
    answer *= n ÷ gcd(answer, n)
  end

  answer |> println
  return nothing
end


@time main()