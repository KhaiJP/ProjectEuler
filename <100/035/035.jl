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


function main():: Nothing
  upper_limit :: Int = 10^6
  ps    = primes(upper_limit)
  rts   = map(p -> rotates(p), ps)
  bools = map(rt -> all(map(isprime, rt)), rts)
  bools |> count |> println

  return nothing
end


@time main()
