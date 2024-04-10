function reverseNum(n:: BigInt):: BigInt
  m:: BigInt = 0
  while n > 0
    m *= 10
    m += n % 10
    n ÷= 10
  end

  return m
end


LychrelProcess(n:: BigInt):: BigInt = n + reverseNum(n)
isPalindrome(n:: BigInt):: Bool     = ==(n |> string, n |> string |> reverse)


function evalNumIters(n:: BigInt, depth:: Int = 0):: Int
  if depth >= 50
    return 10^8
  elseif depth > 0 && n |> isPalindrome
    return depth
  else
    next_n:: BigInt = n |> LychrelProcess
    return evalNumIters(next_n, depth+1)
  end
end
evalNumIters(n:: Int):: BigInt = evalNumIters(big(n))


function main():: Nothing
  upper_limit:: BigInt   = 10^4
  flags:: Base.Generator = ( evalNumIters(n) > 50 for n ∈ 1:upper_limit )
  flags |> sum |> println
  return nothing
end


@time main()
