using Primes

ord(n:: Int):: Int = n |> string |> length

function left_truncatable(n:: Int):: Bool
  if n == 0
    return true
  end
  return n |> isprime ? left_truncatable(n%(10^(ord(n)-1))) : false
end

function right_truncatable(n:: Int):: Bool
  if n == 0
    return true
  end
  return n |> isprime ? right_truncatable(n÷10) : false
end

is_truncatable(n:: Int):: Bool = n |> right_truncatable ? n |> left_truncatable : false


function main():: Nothing
  upper_limit:: Int = 10^7
  count:: Int = 0
  answer:: Int = 0
  for n ∈ 10:upper_limit
    if n |> is_truncatable
      count += 1
      answer += n
    end
    if count == 11
      "11 both-truncatable primes have been found" |> println
      break
    end
  end

  if count < 11
    "only " * string(count) * " both-truncatable primes have been found below " * string(upper_limit) |> println
  end

  answer |> println
  return nothing
end

@time main()