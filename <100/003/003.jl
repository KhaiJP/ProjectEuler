using Primes

function main():: Nothing
  target:: Int = 600851475143
  target |> factor |> keys |> maximum |> println

  return nothing
end

@time main()