function read_file(filename :: String) :: Vector{String}
  s = filename |> readline |> (x -> split(x, ","))
  names = map(String, s)
  return names
end


function eval_name_score(name :: String) :: Int
  score = 0
  for c ∈ name
    if c ∈ 'A':'Z'
      score += Int(c) - Int('A') + 1
    end
  end

  return score
end


function solve(names :: Vector{String}) :: Int
  answer = 0
  for (index, name) ∈ enumerate(names)
    score = eval_name_score(name)
    answer += index * score
  end

  return answer
end


function main() :: Nothing
  filename :: String = "022.txt"
  filename |> read_file |> sort |> solve |> println
end


@time main()
