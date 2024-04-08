using Primes

function main():: Nothing
  upper_limit:: Int = 2*10^6-1
  upper_limit |> primes |> sum |> println

  return nothing
end


@time main()
