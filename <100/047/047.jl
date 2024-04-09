using Primes


function solve(upper_limit:: Int):: Int
  arr:: Array{Int} = Array(1:upper_limit)
  equiv4 = n -> ==(n, 4)
  has_4_prime_factors = equiv4 ∘ length ∘ keys ∘ factor
  conditions:: Array{Bool} = has_4_prime_factors.(arr)
  sequence4 = (all(conditions[j:j+3]) for j ∈ 1:(upper_limit-4))
  r = findfirst(sequence4)

  return r |> isnothing ? -1 : r
end


function main():: Nothing
  upper_limit:: Int = 10^6
  upper_limit |> solve |> println

  return nothing
end


@time main()
