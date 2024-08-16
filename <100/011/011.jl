function read_file(filename :: String) :: Matrix{Int}
  strToInt  = s -> parse(Int, s)
  strToInts = s -> map(strToInt ∘ String, split(s, " "))
  mat = filename |> readlines |> s -> map(strToInts, s) |> v -> hcat(v...) 
  return mat
end


function add(a :: Tuple{T1, T2}, b :: Tuple{T1, T2}) :: Tuple{T1, T2} where {T1, T2}
  (a1, a2) = a
  (b1, b2) = b
  return (a1 + b1, a2 + b2)
end


function mult(k :: T0, a :: Tuple{T1, T2}) :: Tuple{T1, T2} where {T0, T1, T2}
  (a1, a2) = a
  return (k * a1, k * a2)
end


function collect(mat :: Matrix{Int}, coord :: Tuple{Int, Int}, direction :: String) :: Vector{Int}
  direction_dict :: Dict{String, Tuple{Int, Int}} = Dict(
    "upper_right" => (-1, 1),
    "right"  => ( 0, 1),
    "lower_right" => ( 1, 1),
    "down"  => ( 1, 0)
  )

  addk = k -> add(coord, mult(k, direction_dict[direction]))
  coords :: Vector{Tuple{Int, Int}} = [addk(k) for k ∈ 0:3]
  values :: Vector{Int} = [get(mat, coord, 0) for coord ∈ coords]
  return values
end


function solve(mat :: Matrix{Int}) :: Int
  answer = 0
  n :: Int = size(mat)[1]
  directions :: Set{String} = Set(["upper_right", "right", "lower_right", "down"])
  for i ∈ 1:n
    for j ∈ 1:n
      for d ∈ directions
        collection :: Vector{Int} = collect(mat, (i, j), d)
        candidate :: Int = prod(collection)
        answer = max(answer, candidate)
      end
    end
  end
  
  return answer
end


function main() :: Nothing
  filename :: String = "011.txt"
  filename |> read_file |> solve |> println
end


@time main()
