using Primes


function quadraticGenerator(a:: Int, b:: Int)
  f(n:: Int):: Int = n^2 + a*n + b
  return f
  # return n -> n^2 + a*n + b
end


function findLength(f):: Int
  # sufficiently big number
  upper_limit = 10^8
  for n ∈ 1:upper_limit
    if n |> f |> isprime |> !
      return n
    end
  end

  return -1
end


function primeLength(a:: Int, b:: Int):: Int
  f = quadraticGenerator(a, b)
  l = findLength(f)
  return l
end


function main():: Nothing
  abs_limit = 1000
  l = [primeLength(a, b) for a ∈ -abs_limit:abs_limit, b ∈ -abs_limit:abs_limit]
  coordinates = findmax(l)[2]
  x = coordinates[1] - (abs_limit + 1)
  y = coordinates[2] - (abs_limit + 1)
  println(x * y)

  return nothing
end


@time main()
