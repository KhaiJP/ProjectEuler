using Primes


stringToArray(s:: String):: Array{Char} = [c for c ∈ s]


function arePermutes(n:: Int, m:: Int):: Bool
  s = n |> string |> stringToArray |> sort
  t = m |> string |> stringToArray |> sort
  return s == t
end


function totientRate(n:: Int):: Float64
  phi = totient(n)
  if arePermutes(n, phi)
    return n / phi
  else
    return 10^7
  end
end


function main():: Nothing
  upper_limit = 10^7-1
  info_min = map(totientRate, 2:upper_limit) |> findmin
  info_min[2] + 1 |> println
  return nothing 
end


@time main()
