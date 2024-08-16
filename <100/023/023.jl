using Primes

"returns ∑_{k=0}^up_to r^k = 1 + r + r^2 + ⋯ + r^up_to"
function geometric_sum(r :: Integer, up_to :: Integer) :: Integer
  if r == 1
    return up_to + 1
  end
  return (r^(up_to+1) - 1) ÷ (r - 1)
end


function divisors_sum(n :: Integer) :: Integer
  pfs = factor(n)
  l = [geometric_sum(p[1], p[2]) for p ∈ pfs]
  return prod(l)
end


function proper_divisors_sum(n :: Integer) :: Integer
  return divisors_sum(n) - n
end


function is_abundant(n :: Integer) :: Bool
  return n < proper_divisors_sum(n)
end


function solve(upper_limit :: Integer) :: Integer
  d :: Dict{Integer, Integer} = Dict(j => 0 for j ∈ 1:upper_limit)
  abundants = filter(is_abundant, 1:upper_limit)
  N = length(abundants)
  for i ∈ 1:N
    for j ∈ i:N
      ab1 = abundants[i]
      ab2 = abundants[j]
      sum_abs = ab1 + ab2
      if upper_limit < sum_abs
        break
      end

      d[sum_abs] += 1
    end
  end

  result :: Integer = 0
  for p ∈ d
    if p[2] == 0
      result += p[1]
    end
  end

  return result
end


function main() :: Nothing
  upper_limit :: Int = 28123
  upper_limit |> solve |> println
end


@time main()
