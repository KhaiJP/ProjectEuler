using Primes

# see <100/028/028.md for the meanings of b, c, d.
b(n:: Int):: Int    = 4*n^2 + 2*n + 1
c(n:: Int):: Int    = 4*n^2       + 1
d(n:: Int):: Int    = 4*n^2 - 2*n + 1
side_length(n:: Int):: Int = 2*n + 1
cnt_primes(n:: Int):: Int = isprime.([b(n), c(n), d(n)]) |> sum

function main():: Nothing
  upper_limit:: Int = 10^6
  num_primes:: Int = 0
  num_total:: Int = 1
  for n ∈ 1:upper_limit
    num_total += 4
    num_primes += cnt_primes(n)
    if 10 * num_primes < num_total
      n |> side_length |> println
      return nothing
    end
  end
end


@time main()
