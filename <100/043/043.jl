using Combinatorics


function isOK(v:: Array{Char}):: Bool
  if v[1] == '0'
    return false
  end


  ref = [2, 3, 5, 7, 11, 13, 17]
  for (index, p) ∈ enumerate(ref)
    s:: String = ""
    for k ∈ 0:2
      s *= v[index+k+1]
    end
    tmp = parse(Int, s)
    if tmp % p != 0
      return false
    end
  end
  return true
end


function joinParse(v:: Array{Char}):: Int
  s = ""
  for c ∈ v
    s *= c
  end
  return parse(Int, s)
end


function main():: Nothing
  s = "0123456789"
  perms = permutations(s)
  answer = sum(joinParse(v) for v in perms if isOK(v))
  answer |> println
  return nothing
end


@time main()
