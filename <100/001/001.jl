function main():: Nothing
  v :: Vector{Int} = [n for n in 1:999 if n%3 == 0 || n%5 == 0]
  answer:: Int = sum(v)
  answer |> println

  return nothing
end


@time main()
