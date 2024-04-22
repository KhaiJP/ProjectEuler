using Primes


totientRate(n:: Int):: Float64 = n / totient(n)


function main():: Nothing
  upper_limit = 10^6
  infor_max = map(totientRate, 1:upper_limit) |> findmax
  infor_max[2] |> println
  return nothing
end


@time main()
