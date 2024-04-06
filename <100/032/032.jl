# consider patterns that a*b = c is pandigital. for the sake of simplist we write n-digit as n-d.
# 1 * 23456 = 23456, 9 * 234 = 2106-> 1-d * 5-d = 5-d or 6-d, 1-d * 3-d = 3-d or 4-d -> cannot be 1-9 pandigital.
# by doing the same analysis, pandigital set is 1-d * 4-d = 4-d or 2-d * 3-d = 4*d.

function check(a:: Int, b:: Int, c:: Int, target:: Array{Char}):: Bool
  s:: String = string(a) * string(b) * string(c)
  l:: Vector{Char} = [char for char ∈ s]
  sort!(l)
  return l == target
end

function  main():: Nothing
  target:: Array{Char} = [c for c ∈ "123456789"]
  S:: Set{Int} = Set() 

  for a ∈ 1:9
    for b ∈ 1234:9999
      c:: Int = a * b
      if check(a, b, c, target)
        push!(S, c)
      end
    end
  end

  for a ∈ 11:999
    for b ∈ 123:9999
      c:: Int = a * b
      if check(a, b, c, target)
        push!(S, c)
      end
    end
  end

  S |> sum |> println
  return nothing
end

@time main()