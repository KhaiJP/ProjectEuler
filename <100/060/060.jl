using Primes

pairCat(n:: Int, m:: Int):: Int = parse(Int, string(n) * string(m))
arePairPrimes(n:: Int, m:: Int):: Bool = pairCat(n, m) |> isprime && pairCat(m, n) |> isprime 


function allPairPrimes(arr:: Array{Int}):: Bool
  L:: Int = arr |> length
  for j ∈ 1:(L-1)
    if arePairPrimes(arr[j], arr[L]) |> !
      return false
    end
  end

  return true
end


function naiveSolve(upper_limit:: Int):: Int
  Ps:: Array{Int} = primes(upper_limit)
  L:: Int = Ps |> length
  arr:: Array{Int} = []
  answer:: Int = 10^18

  for j1 ∈ 1:L
    push!(arr, Ps[j1])
    if arr |> sum >= answer
      pop!(arr)
      break
    end
    for j2 ∈ (j1+1):L
      push!(arr, Ps[j2])
      if arr |> sum >= answer
        pop!(arr)
        break
      end
      if arr |> allPairPrimes |> !
        pop!(arr)
        continue
      end
      for j3 ∈ (j2+1):L
        push!(arr, Ps[j3])
        if arr |> sum >= answer
          pop!(arr)
          break
        end
        if arr |> allPairPrimes |> !
          pop!(arr)
          continue
        end
        for j4 ∈ (j3+1):L
          push!(arr, Ps[j4])
          if arr |> sum >= answer
            pop!(arr)
            break
          end
          if arr |> allPairPrimes |> !
            pop!(arr)
            continue
          end
          for j5 ∈ (j4+1):L
            push!(arr, Ps[j5])
            if arr |> sum >= answer
              pop!(arr)
              break
            end
            if arr |> allPairPrimes |> !
              pop!(arr)
              continue
            end
            s:: Int = arr |> sum
            if s < answer
              answer = s
            end
            pop!(arr)
          end
          pop!(arr)
        end
        pop!(arr)
      end
      pop!(arr)
    end
    pop!(arr)
  end

  return answer
end


function main():: Nothing
  upper_limit:: Int = 10^4
  upper_limit |> naiveSolve |> println
end


@time main()
