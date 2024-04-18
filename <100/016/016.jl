function digitSum(n:: BigInt):: Int
  if n == 0
    return 0
  else
    return n%10 + digitSum(n÷10)
  end
end


function main():: Nothing
  base:: BigInt = big(2)
  power:: Int   = 1000
  base^power |> digitSum |> println

  return nothing  
end


@time main()
