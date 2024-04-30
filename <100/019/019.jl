function Zeller(dd:: Int, mm:: Int, yy:: Int):: Int
  if mm < 3
    mm += 12
    yy -= 1
  end

  C = yy ÷ 100
  Γ = -2C + C÷4
  Y = yy % 100
  M = 26*(mm + 1)
  k = dd + M÷10 + Y + Y÷4 + Γ
  if k < 0
    return (7+k%7)%7
  else
    return k%7
  end
end


function main():: Nothing
  answer = [1 for m ∈ 1:12 for y ∈ 1901:2000 if Zeller(1, m, y) == 1] |> sum
  answer |> println
  return nothing
end


@time main()
