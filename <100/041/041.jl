using Primes

function is_pandigital(n:: Int):: Bool
  d:: Array{Int} = [parse(Int, c) for c ∈ n |> string]
  sort!(d)
  r:: Array{Int} = [j for j ∈ 1:(length(d))]

  return d == r
end

function solve(upper_limit:: Int):: Int
  for n ∈ upper_limit:-1:1
    if ( n |> isprime |> ! ) && ( n |> is_pandigital )
      return n
    end
  end
end

function main():: Nothing
  # no 9-digit and 8-digit pandigital can be prime as they are multiple of 3
  upper_limit:: Int = 7654321
  upper_limit |> solve |> println

  return nothing
end


@time main()