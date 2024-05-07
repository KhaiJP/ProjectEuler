# let us consider if there exists an upper limit of the number enjoying the condition.
# the maximum m-digit number is apprently m * 9^5 = 59049m bu< 60000m. to enjoy the condition,
# this number must be greater than or equal to 10^(m-1) (note 10^m is m+1-digit number).
# for m = 7, 60000m = 420,000 < 1,000,000 = 10^(m-1) -> m <= 6 -> no number greater than 360000 enjoy the condition.

function is_ok(n:: Int):: Bool
  power:: Int = 5
  l = ((c-'0')^power for c ∈ string(n))
  equiv_n = y -> n == y
  return l |> sum |> equiv_n
end

function main():: Nothing
  upper_limit:: Int = 360000

  a = ( n for n ∈ 2:upper_limit if is_ok(n) )
  a |> sum |> println
  return nothing
end

@time main()