# let us consider if there exists an upper limit of the number enjoying the condition.
# the maximum m-digit number is apprently m * 9^5 < 60000m. to enjoy the condition,
# this number must be less than 10^m (note 10^m is m+1-digit number).
# for m = 6, 60000m = 360,000 > 1,000,000 = 10^m -> no number greater than 360000 enjoy the condition. 
power = 5
upper_limit = 360000

function is_ok(n:: Int):: Bool
  l = ((c-'0')^power for c ∈ string(n))
  equiv_n = y -> n == y
  return l |> sum |> equiv_n
end

@time function main():: Nothing
  a = ( n for n ∈ 2:upper_limit if is_ok(n) )
  a |> sum |> println
  return nothing
end

main()