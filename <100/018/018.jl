function splitInts(s :: String, c :: String = " ") :: Vector{Int}
  substrings :: Vector{SubString{String}} = split(s, c)
  strings :: Vector{String} = map(String, substrings)
  results :: Vector{Int} = map(x -> parse(Int, x), strings)
  return results
end


function readMatrix(filename :: String) :: Matrix{Int}
  f = open(filename, "r")
  readedStrings = f |> readlines
  n = readedStrings |> length
  mat :: Matrix{Int} = zeros(n, n)
  readedValues :: Vector{Vector{Int}} = map(splitInts, readedStrings)
  for i ∈ 1:n
    for j ∈ 1:i
      mat[i, j] = readedValues[i][j]
    end
  end
  return mat 
end


function solve(mat :: Matrix{Int}) :: Int
  n :: Int = size(mat)[1]
  memo :: Matrix{Int} = copy(mat)
  memo[1, 1] = mat[1, 1]
  for i ∈ 1:(n-1)
    for j ∈ 1:i
      memo[i+1,j]   = max(memo[i+1, j],   mat[i+1, j]   + memo[i, j])
      memo[i+1,j+1] = max(memo[i+1, j+1], mat[i+1, j+1] + memo[i, j])
    end
  end
  
  answer :: Int = maximum(memo[n, :])
  return answer
end


function main() :: Nothing
  filename :: String = "018.txt"
  filename |> readMatrix |> solve |> println
end


main()
