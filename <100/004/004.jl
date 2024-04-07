is_palindrome(s:: String):: Bool = reverse(s) == s
is_palindrome(n:: Int):: Bool = n |> string |> is_palindrome

function main():: Nothing
  answer:: Int = 0
  for a ∈ 100:999
    for b ∈ 100:999
      c:: Int = a * b
      if c |> is_palindrome
        answer = max(answer, c)
      end
    end
  end

  answer |> println
  return nothing
end


@time main()
