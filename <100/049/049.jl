using Primes


function are_permutations(p1:: Int, p2:: Int):: Bool
  arr1:: Array{Char} = [c for c ∈ p1 |> string]
  arr2:: Array{Char} = [c for c ∈ p2 |> string]
  sort!(arr1)
  sort!(arr2)

  return arr1 == arr2
end


function solve(arr:: Array{Int}):: String
  L:: Int = arr |> length
  for i ∈ 1:(L-2)
    if arr[i] <= 1487
      continue
    end
    for j ∈ (i+1):(L-1)
      if are_permutations(arr[i], arr[j]) |> !
        continue
      end
      p:: Int = 2arr[j]-arr[i]
      if are_permutations(arr[i], p) && isprime(p)
        answer:: String = string(arr[i]) * string(arr[j]) * string(p)
        return answer
      end
    end
  end
end


function main():: Nothing
  lower_limit:: Int = 10^3
  upper_limit:: Int = 10^4
  Ps:: Array{Int} = primes(lower_limit, upper_limit)
  Ps |> solve |> println
end


@time main()
