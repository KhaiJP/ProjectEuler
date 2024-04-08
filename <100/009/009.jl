function solve(target:: Int):: Int
  for a ∈ 1:target
    for b ∈ (a+1): target
      c = target - (a+b)
      if c > 0 && a^2 + b^2 == c^2
        return a * b * c
      end
    end
  end
end


function main():: Nothing
  target:: Int = 1000
  target |> solve |> println
end


@time main()