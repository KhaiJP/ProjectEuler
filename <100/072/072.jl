function main():: Nothing
  max_d:: Int  = 12000
  answer:: Int = 0
  for d ∈ max_d:-1:4
    n:: Int = d÷2 - 1 + (d%2)
    while 3*n > d
      answer += (gcd(n, d) == 1) ? 1 : 0
      n -= 1
    end
  end

  answer |> println
  return nothing
end


@time main()
