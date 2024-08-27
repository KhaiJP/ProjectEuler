using Primes


function partition(n :: Int, k :: Int, memo :: Matrix{Int}) :: Int
  if n == 0
    return 1
  elseif k == 0
    return 0
  elseif 0 < memo[begin+n, begin+k]
    return memo[begin+n, begin+k]
  end
  
  a :: Int = partition(n, k-1, memo)
  b = isprime(k) && k ≤ n ? partition(n-k, k, memo) : 0

  memo[begin+n, begin+k] = a + b
  return memo[begin+n, begin+k]
end


function achieved_target(n :: Int, memo :: Matrix{Int}) :: Bool
  target :: Int = 5000
  p = partition(n, n, memo)
  return target < p
end


function main() :: Nothing
  upper_limit :: Int = 200
  memo :: Matrix{Int} = zeros(upper_limit+10, upper_limit+10)

  for n ∈ 2:upper_limit
    if achieved_target(n, memo)
      n |> println
      return nothing
    end
  end

  return -1
end


@time main()
