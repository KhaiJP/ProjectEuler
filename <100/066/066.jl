function sqrtInt(n :: Int128, smaller :: Int128, bigger :: Int128) :: Int128
  if bigger - smaller == 1
    return smaller
  end
  mid = (bigger + smaller) ÷ 2
  s = mid^2
  if s <= n
    return sqrtInt(n, mid, bigger)
  else
    return sqrtInt(n, smaller, mid)
  end
end


function findFirst(n :: Int128) :: Tuple{Int128, Int128, Int128}
  smaller :: Int128 = 0
  bigger :: Int128 = 10^9
  s = sqrtInt(n, smaller, bigger)
  return (n, s, n-s^2)
end


function find_continued_fraction!(tk :: Tuple{Int128, Int128, Int128},
                     v :: Vector{Int128},
                     s :: Set{Tuple{Int128, Int128, Int128}}
                     ) :: Nothing
  (nk, bk, dk) = tk
  smaller :: Int128 = 0
  bigger :: Int128 = 10^9
  sk = sqrtInt(nk, smaller, bigger) + bk
  ak = sk ÷ dk
  ck = dk * ak - bk

  dk1 = nk - ck^2
  hcf = gcd(dk, dk1)
  dk  = dk ÷ hcf
  dk1 = dk1 ÷ hcf

  nk1 = dk^2 * nk
  bk1 = dk * ck
  tk1 = (nk1, bk1, dk1)

  if tk1 ∈ s
    return nothing
  end
  push!(s, tk1)
  push!(v, ak)
  return find_continued_fraction!(tk1, v, s)
end


function reproduce_continued_fraction(v :: Vector{Int128}) :: Rational{Int128}
  n :: Int128 = 0
  d :: Int128 = 1
  N :: Int128 = length(v)

  while v |> isempty |> !
    tmp :: Int128 = d
    k :: Int128 = v[end]
    d = d * k + n
    n = tmp
    pop!(v)
    hcf = Int128(gcd(n, d))
    n ÷= hcf
    d ÷= hcf
  end

  n, d = d, n
  return n // d
end


function even_case(v :: Vector{Int128}) :: Rational{Int128}
  return reproduce_continued_fraction(v)
end


function odd_case(v :: Vector{Int128}, D :: Int128) :: Rational{Int128}
  r = reproduce_continued_fraction(v)
  x = numerator(r)
  y = denominator(r)
  X = x^2 + D*y^2
  Y = 2 * x * y
  return X // Y
end


function solve_Pell_equation(D :: Int128) :: Int128
  t = findFirst(D)
  (_, a, d) = t
  if d == 0
    return -1
  end

  v :: Vector{Int128} = [a]
  s :: Set{Tuple{Int128, Int128, Int128}} = Set([t])
  
  find_continued_fraction!(t, v, s)

  period = length(v)
  if period % 2 == 0
    p = even_case(v)
  else
    p = odd_case(v, D)
  end

  return numerator(p)
end


function solve(upper_limit :: Int) :: Tuple{Int, Int128}
  max_D :: Int = 0
  max_x :: Int128 = 0

  for D ∈ 1:upper_limit
    x = solve_Pell_equation(Int128(D))
    if max_x < x
      max_x = x
      max_D = D
    end
  end

  return (max_D, max_x)
end


function main() :: Nothing
  upper_limit = 10^3
  upper_limit |> solve |> println
end


@time main()
