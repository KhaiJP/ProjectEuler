function primitivePythagoreanGenerator(n :: Int, m :: Int) :: Tuple{Int, Int, Int}
  if n ≤ m || 1 < gcd(n, m) || n%2 == m%2
    return (-1, -1, -1)
  end

  (a, b, c) = (n^2 - m^2, 2 * n * m, n^2 + m^2)
  if b < a
    a, b = b, a
  end
  
  return (a, b, c)
end


function main() :: Nothing
  max_L = 1500000
  counts = [0 for _ ∈ 1:max_L]
  for n ∈ 1:max_L
    if max_L <= n^2
      break
    end
    for m ∈ 1:n
      (a, b, c) = primitivePythagoreanGenerator(n, m)
      if a < 0
        continue
      end

      L = a + b + c
      buf = L
      while L ≤ max_L
        counts[L] += 1
        L += buf
      end
    end
  end

  counts |> v -> filter(x -> x == 1, v) |> sum |> println
end


@time main()
