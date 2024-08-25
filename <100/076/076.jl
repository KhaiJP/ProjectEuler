function partition(n :: Int, k :: Int, memo :: Matrix{Int}) :: Int
  if n < k
    return 0
  end
  if n == k
    memo[begin+n, begin+k] = 1
    return memo[begin+n, begin+k]
  end
  if n ≤ length(memo) && k ≤ length(memo[begin]) && 0 < memo[begin+n, begin+k]
    return memo[begin+n, begin+k]
  end
  
  nk1 = partition(n, k+1, memo)
  nkk = 0
  if 0 < k
    nkk = partition(n-k, k, memo)
  end

  memo[begin+n, begin+k] = nk1 + nkk
  return memo[begin+n, begin+k]
end


function main() :: Nothing
  memo :: Matrix{Int} = zeros(110, 110)
  answer = partition(100, 1, memo) - 1
  answer |> println
end


@time main()
