function readFileAt(filepath:: String):: Array{BigInt}
  f = open(filepath, "r")
  lines = readlines(f)
  close(f)

  parseBig(s) = parse(BigInt, s)
  bigIntArray = map(parseBig, lines) 
  return bigIntArray
end


function main():: Nothing
  filepath   = "013.txt"
  showDigits = 10
  sumString  = filepath |> readFileAt |> sum |> string 
  sumString[1:showDigits] |> println
end


@time main()
