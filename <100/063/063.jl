function is_ok(a :: Int, p :: Int) :: Bool
  a_ :: BigInt = a
  n = a_^p
  l = n |> string |> length
  return l == p
end


function main() :: Nothing
  answer = 0
  for a ∈ 1:9
    for p ∈ 1:100
      if is_ok(a, p)
        answer += 1
      else
        break
      end
    end
  end
  
  answer |> println
end


@time main()
