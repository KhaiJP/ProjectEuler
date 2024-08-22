function digitSum(n :: BigInt) :: BigInt
  result = 0
  while 0 < n
    result += n % 10
    n ÷= 10
  end

  return result
end


function reproduce_continued_fraction(v :: Vector{Int}) :: Tuple{BigInt, BigInt}
  n :: BigInt = 0
  d :: BigInt = 1
  N :: BigInt = length(v)

  while v |> isempty |> !
    tmp :: BigInt = d
    k :: BigInt = v[end]
    d = d * k + n
    n = tmp
    pop!(v)
    hcf = BigInt(gcd(n, d))
    n ÷= hcf
    d ÷= hcf
  end

  n, d = d, n
  return (n, d)
end


function generate_E(sz :: Int) :: Vector{Int}
  v :: Vector{Int} = []
  if sz == 0
    return v
  end
  push!(v, 2)
  if sz == 1
    return v
  end
  push!(v, 1)
  if sz == 2
    return v
  end
  push!(v, 2)
  if sz == 3
    return v
  end

  i :: Int = 1
  j :: Int = 2
  while length(v) < sz
    if i > 0
      push!(v, 1)
    else
      push!(v, 2*j)
      j += 1
    end

    i = (i+1) % 3
  end
  
  return v
end


function main() :: Nothing
  upper_limit :: Int = 100
  upper_limit |> generate_E |> reproduce_continued_fraction |> (t -> t[1]) |> digitSum |> println
end


@time main()
