function readfile(filename:: String):: Array{String}
  f = open(filename, "r")
  arr:: Array{String} = readlines(f)
  close(f)
  
  return arr
end

function cat_strings(arr:: Array{String}):: String
  S:: String = ""
  for s ∈ arr
    S *= s
  end

  return S
end

function solve(S:: String):: Int
  answer:: Int = 0
  L:: Int = S |> length
  width:: Int = 13
  for j ∈ 1:(L-width)
    tmp:: Int = 1
    for c ∈ S[j : j + width-1]
      tmp *= parse(Int, c)
    end
    answer = max(answer, tmp)
  end

  return answer
end

function main():: Nothing
  filename = "008.txt"
  filename |> readfile |> cat_strings |> solve |> println
  return nothing
end


@time main()