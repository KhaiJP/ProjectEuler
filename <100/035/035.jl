using Primes


function rotate(n:: Int):: Int
  ord = n |> string |> length |> (x -> x-1)
  lsd = n % 10
  n   = n ÷ 10
  n   = n + lsd * 10^ord
  return n
end


function rotates(n:: Int):: Array{Int}
  arr = Array{Int}([])
  ord = n |> string |> length
  for _ ∈ 1:ord
    n = rotate(n)
    push!(arr, n)
  end
  return arr
end


function all_rotates_primes(n:: Int):: Bool
  rotations = rotates(n)
  bools     = map(isprime, rotations)
  return bools |> all
end


function main():: Nothing
  upper_limit :: Int = 10^6
  ps    = primes(upper_limit)
  bools = map(all_rotates_primes, ps)
  bools |> count |> println

  return nothing
end


@time main()
