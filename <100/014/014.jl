function Collatz(n:: Int):: Int
  if n <= 1
    return n
  elseif n%2 == 0
    return Collatz(n÷2) + 1
  else
    return Collatz(3n+1) + 1
  end
end


function main():: Nothing
  upper_limit:: Int = 10^6
  CollatzSequence:: Array{Tuple{Int, Int}} = [(Collatz(n), n) for n ∈ 1:upper_limit]
  CollatzSequence |> sort!
  CollatzSequence[end][end] |> println 
end


@time main()