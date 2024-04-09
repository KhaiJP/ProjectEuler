using Primes


function enjoy_GB_conj(n:: Int):: Bool
  for j ∈ 1:n
    target:: Int = n - 2*j^2
    if target <= 0
      return false
    elseif target |> isprime
      return true
    end
  end
  return false
end


function main():: Nothing
  upper_limit:: Int = 10^6
  counter_examples:: Base.Generator = (n for n ∈ 5:2:upper_limit if ((n |> isprime |> !) && (n |> enjoy_GB_conj |> !)))
  counter_examples |> typeof |> println

  for answer ∈ counter_examples
    message = string(answer) * " is the smallest composite composite number that break the GB conjecture"
    message |> println
    return nothing
  end

  message = "all the composite numbers up to " * string(upper_limit) * " enjoy the GB conjecture"
  message |> println
  return nothing
end


@time main()