string_0b(n:: Int):: String = string(n, base=2)
is_palindrome(s:: String):: Bool = reverse(s) == s
is_ok(n:: Int):: Bool = n |> string |> is_palindrome ? n |> string_0b |> is_palindrome : false

function main()::Nothing
  upper_limit:: Int = 10^6-1
  values = (val for val ∈ 1:upper_limit if is_ok(val))
  values |> sum |> println
  
  return nothing
end

@time main()