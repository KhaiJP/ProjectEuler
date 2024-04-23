using Primes


function main():: Nothing
  upper_limit:: Int = 10^6
  totients = A -> map(totient, A)
  2:upper_limit |> totients |> sum |> println
  return nothing
end


@time main()
