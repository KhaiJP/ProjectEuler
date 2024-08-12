function pythagoreanGenerator(tp :: Tuple{Int, Int}) :: Tuple{Int, Int, Int}
  (m, n) = tp
  if gcd(m, n) ≠ 1 || m%2 == n%2
    return (-1, -1, -1)
  end

  return (m^2 - n^2, 2*m*n, m^2 + n^2)
end


function perimeter(triangle :: Tuple{Int, Int, Int}) :: Int
  (a, b, c) = triangle
  return a + b + c
end


function update(memo :: Dict{Int, Int}, upper_limit :: Int, p :: Int) :: Dict{Int, Int}
  ps :: Vector{Int} = [n*p for n in 1:(upper_limit ÷ p)]
  for p_ ∈ ps
    memo[p_] += 1
  end
  return memo
end


function initMemoGenerator(upper_limit :: Int) :: Dict{Int, Int}
  init_memo :: Dict{Int, Int} = Dict(p => 0 for p ∈ 1:upper_limit)
  return init_memo
end


function countPerimeters(upper_limit :: Int) :: Dict{Int, Int}
  memo = initMemoGenerator(upper_limit)
  for n ∈ 1:(upper_limit-1)
    for m ∈ (n+1):upper_limit
      triangle = pythagoreanGenerator((m, n))
      p = perimeter(triangle)
      if p < 0
        continue
      end
      memo = update(memo, upper_limit, p)
    end
  end

  return memo
end


function whichKeyGenerateMaxValue(d :: Dict{Int, Int}) :: Int
  c = [(v, k) for (k, v) ∈ d]
  return maximum(c)[2]
end


function main() :: Nothing
  upper_limit :: Int = 1000
  upper_limit |> countPerimeters |> whichKeyGenerateMaxValue |> println
  return nothing
end


@time main()
