using Primes
using StatsBase

function primeFactors(n:: Int):: Array{Array{Int}}
  r = factor(Array{Int}, n) |> rle
  rles = [[a, l] for (a, l) ∈ zip(r[1], r[2]) ]
end

primeSum((p, n)) = (p^(n+1) - 1) ÷ (p - 1)
mPrimeSum   = v -> map(primeSum, v)
divisorsSum = prod ∘ mPrimeSum ∘ primeFactors


function d(n:: Int):: Int
  if n == 0
    return 0
  else
    return divisorsSum(n) - n
  end
end


function isAmicable(n:: Int):: Bool
  dn = d(n)
  return dn != n && d(dn) == n
end


function main():: Nothing
  upper_limit:: Int = 10^4 - 1
  [n for n ∈ 1:upper_limit if n |> isAmicable] |> sum |> println
  return nothing
end


@time main()
