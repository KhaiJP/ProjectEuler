using Combinatorics


function main()
  S:: String = "0123456789"
  perms = permutations(S, length(S))

  for (cnt, item) in enumerate(perms)
    if cnt == 10^6
      item |> String |> println
      return
    end
  end
end


@time main()
