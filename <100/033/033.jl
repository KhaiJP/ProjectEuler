function pseudo_reduction(n :: Integer, d :: Integer) :: Rational{Integer}
  (ns, ds) = (string(n), string(d))
  if ns[1] == ds[1]
    return ns[2] == 0 || ds[2] == 0 ? 101 // 100 : parse(Integer, ns[2]) // parse(Integer, ds[2])
  end
  if ns[1] == ds[2]
    return ns[2] == 0 || ds[1] == 0 ? 101 // 100 : parse(Integer, ns[2]) // parse(Integer, ds[1])
  end
  if ns[2] == ds[1]
    return ns[1] == 0 || ds[2] == 0 ? 101 // 100 : parse(Integer, ns[1]) // parse(Integer, ds[2])
  end
  if ns[2] == ds[2]
    return ns[1] == 0 || ds[1] == 0 ? 101 // 100 : parse(Integer, ns[1]) // parse(Integer, ds[1])
  end

  return 101 // 100
end


function is_ok((n, d) :: Tuple{Integer, Integer}) :: Bool
  proper = n // d
  pseudo = pseudo_reduction(n, d)
  
  return proper == pseudo
end


function main() :: Nothing
  candidates :: Vector{Tuple{Int, Int}} = [(n, d) for d ∈ 11:99 for n ∈ 11:(d-1) if n%10 ≠ 0 || d%10 ≠ 0]
  good_pairs = filter(is_ok, candidates)
  rationals = map(t -> t[1] // t[2], good_pairs)
  rationals |> prod |> denominator |> println
end


@time main()
