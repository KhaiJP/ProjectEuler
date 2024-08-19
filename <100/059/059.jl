function read_file(filename:: String) :: Vector{Int}
  ls = filename |> readline |> (x -> split(x, ","))
  vc = map(String, ls)
  vn = map(x -> parse(Int, x), vc)
  return vn 
end


function xor_s(numbers :: Vector{Int}, keys :: Vector{Int}) :: String
  keys = map(x -> x + Int('a'), keys)
  len = numbers |> length
  nk  = keys |> length
  vc :: Vector{Char} = ['a' for _ ∈ 1:len]
  for i ∈ 1:len
    xored = ⊻(numbers[i], keys[begin + i%nk])
    vc[i] = Char(xored)
  end

  return String(vc)
end


function sum_message(message :: String) :: Int
  chars = collect(message)
  ints = map(Int, chars)
  return sum(ints)
end


function solve(filename :: String) :: Int
  numbers = filename |> read_file
  for keys ∈ 0:(26^3-1)
    k1 = keys % 26
    k2 = (keys ÷ 26) % 26
    k3 = (keys ÷ 26^2) % 26
    message :: String = xor_s(numbers, [k1, k2, k3])
    if occursin("Euler", message)
      message |> println
      return sum_message(message)
    end
  end

  return -1
end


function main() :: Nothing
  filename :: String = "059.txt"
  filename |> solve |> println
end


@time main()
