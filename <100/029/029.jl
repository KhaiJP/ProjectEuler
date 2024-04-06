function main():: Nothing
  S:: Set{BigInt} = Set()
  for a ∈ 2:100
    for b ∈ 2:100
      a_:: BigInt = big(a)
      b_:: BigInt = big(b)
      push!(S, a_^b_)
    end
  end

  S |> length |> println
  return nothing
end

@time main()
