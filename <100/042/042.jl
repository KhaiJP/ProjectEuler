function extract_upper(s:: String):: String
  result = ""
  for c ∈ s
    if isuppercase(c)
      result *= c
    end
  end
  return result
end


function score(s:: String):: Int
  result = 0
  for c ∈ s
    result += Int(c) - Int('A') + 1
  end
  return result
end


function has_inverse(n:: Int, f:: Function):: Bool
  bigger:: Int = 10 ^ 8
  smaller:: Int = 0
  while bigger - smaller > 1
    mid:: Int = (bigger + smaller) ÷ 2

    if n <= f(mid)
      bigger = mid
    else
      smaller = mid
    end
  end

  return f(bigger) == n
end
triangle_prod(n:: Int):: Int   = n * (n+1) ÷ 2
is_triangle(n:: Int):: Bool    = has_inverse(n, triangle_prod)


function main():: Nothing
  filename = "042.txt"
  f = open(filename, "r")
  s:: String = readline(f)
  close(f)
  ret:: Array{String} = split(s, ',')
  ret = map(extract_upper, ret)
  values = map(score, ret)
  good_vals = filter(is_triangle, values)
  good_vals |> length |> println
end


@time main()
