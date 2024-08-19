function sqrtInt(n :: Int, smaller :: Int, bigger :: Int) :: Int
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


function findFirst(n :: Int) :: Tuple{Int, Int, Int}
  s = sqrtInt(n, 0, 10^9)
  return (n, s, n-s^2)
end


function find_period_(v :: Vector{Tuple{Int, Int, Int}}, tk :: Tuple{Int, Int, Int}) :: Int
  l = length(v)
  for i ∈ 1:l
    if v[i] == tk
      return l - i + 1
    end
  end
  return -1
end


function find_period(tk :: Tuple{Int, Int, Int}, v :: Vector{Tuple{Int, Int, Int}}, s :: Set{Tuple{Int, Int, Int}}) :: Int
  (nk, bk, dk) = tk
  sk = sqrtInt(nk, 0, 10^9) + bk
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
    return find_period_(v, tk1)
  end
  push!(s, tk1)
  push!(v, tk1)
  return find_period(tk1, v, s)
end


function main() :: Nothing
  upper_limit = 10^4
  answer = 0
  for i ∈ 2:upper_limit
    t1 = findFirst(i);
    d = t1[3]
    if d == 0
      continue
    end

    v :: Vector{Tuple{Int, Int, Int}} = [t1]
    s :: Set{Tuple{Int, Int, Int}}    = Set([t1])
    p = find_period(t1, v, s)
    answer += p&1
  end

  answer |> println
end


@time main()
