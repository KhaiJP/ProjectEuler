function digitSum(n:: BigInt):: Int
  if n == 0
    return 0
  else
    return n%10 + digitSum(n÷10)
  end
end


function main():: Nothing
  n:: BigInt = big(100)
  n |> factorial |> digitSum |> println

  return nothing
end


@time main()
