using Primes


function make_pfxs(upper_limit:: Int):: Array{Int}
  pfx = Array{Int}([2])
  for p ∈ primes(3, upper_limit)
    q = pfx[end]
    n = p+q
    if n < upper_limit
      push!(pfx, p+q)
    else
      return pfx
    end
  end
end


function solve(pfx:: Array{Int}):: Int
  sequence = 0
  answer   = 0
  l = pfx |> length
  for k ∈ l:-1:1
    if k < sequence
      break
    end

    pk = pfx[k]

    for j ∈ 1:k
      δ  = k - j
      if δ < sequence
        break
      end

      pj  = pfx[j]
      gap = pk - pj
      if gap |> isprime
        sequence = δ
        answer   = gap
      end
    end
  end
  return answer
end


function main():: Nothing
  upper_limit = 10^6
  upper_limit |> make_pfxs |> solve |> println
  return nothing
end


@time main()
