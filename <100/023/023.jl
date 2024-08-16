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