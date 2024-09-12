function area(m :: Int, n :: Int) :: Int
  tn = n * (n+1) ÷2
  tm = m * (m+1) ÷2
  return tn * tm
end


function main() :: Nothing
  mini = 10^9
  target = 2 * 10^6
  answer = 1000000
  for m ∈ 1:200
    for n ∈ m:200
      a = area(m, n)
      gap = abs(target - a)
      if gap < mini
        mini = gap
        answer = m * n
      end
    end
  end
  answer |> println
end


@time main()
