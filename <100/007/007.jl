using Primes

# expecting 10001st prime number appears below 20*10001
# as frequency of prime number appearance decreases at the speed of 1/log(x)
# and 1/log(20*10001) = 1 / 12 -> roughly up to 20000th primes appear below 20*10001
function main():: Nothing
  target:: Int = 10001
  ps = primes(20*target)
  
  ps[target] |> println
  return nothing
end


@time main()