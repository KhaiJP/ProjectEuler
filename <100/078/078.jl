pentagonal_prod(n :: Int) :: Int = n * (3*n - 1) ÷ 2


function partition(n :: Int, memo :: Vector{Int}) :: Int
  val = 0
  sufficiently_big_num = 10^9
  for i ∈ 1:sufficiently_big_num
    coeff = i%2 == 0 ? -1 : 1
    k = pentagonal_prod(i)
    if n-k < 0
      memo[begin+n] = val
      return memo[begin+n]
    end
    val = (val + coeff * memo[begin+n-k]) % 10^6

    k = pentagonal_prod(-i)
    if n-k < 0
      memo[begin+n] = val
      return memo[begin+n]
    end
    val = (val + coeff * memo[begin+n-k]) % 10^6
  end
end


function main() :: Nothing
  memo :: Vector{Int} = [0 for _ ∈ 1:100001]
  memo[1] = 1
  for n ∈ 1:100000
    if partition(n, memo) == 0
      n |> println
      return nothing
    end
  end
end


@time main()
