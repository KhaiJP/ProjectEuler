function solve(upper_limit :: Int) :: Int
  s :: Set{Rational{Int}} = Set()
  for d ∈ 9:upper_limit
    n :: Int = 3 * d ÷ 7
    while 1 < n && gcd(n, d) != 1
      n -= 1
    end
    if 0 < n
      push!(s, n//d)
    end
  end

  return s |> maximum |> numerator
end


function main() :: Nothing
  upper_limit = 10^6
  upper_limit |> solve |> println
end


@time main()
