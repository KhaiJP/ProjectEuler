using FStrings
# apparently the top digit of the answer x is 1, otherwise 6x contains another digit.
# for the same reason x is smaller than 166...6.
# Suppose x is 6-digit number. since x and 3x contain the same digits and 3x is apparently a multiple of 3,
# x is also multiple of 3, which means for x = 1ABCDE, ABCDE ≡ 2 mod 3

makeCharArray(s:: String):: Array{Char} = sort!([char for char ∈ s])


function isOK(n:: Int):: Bool
  s:: String = "1"*string(n, pad=5)
  x:: Int = parse(Int, s)
  
  R:: Array{Char} = makeCharArray(s) 
  tmpCheck(y:: Int):: Bool = ==(makeCharArray(string(y, pad=5)), R)
  
  haveSameDigits:: Base.Generator = (tmpCheck(j*x) for j ∈ 2:6)
  return haveSameDigits |> all
end


function main():: Nothing
  upper_limit:: Int = 666666
  answers:: Base.Generator = (n for n ∈ 2:3:upper_limit if n |> isOK)
  for answer ∈ answers
    "Yay! x has found!! It is 1"*string(answer, pad=5) |> println
    return nothing
  end

  message:: String = f"the answer has not found below 1{upper_limit}. add another digit and try again!!"
  message |> println
  return nothing
end


@time main()