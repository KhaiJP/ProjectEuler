using Primes

function to_char(n :: Int) :: Char
  return string(n)[1]
end


function replace_digits(n :: Int, which :: Int, to :: Int) :: Int
  f = collect ∘ string
  vn :: Vector{Char} = f(n)
  wc :: Char = to_char(which)
  tc :: Char = to_char(to)
  g = c -> c == wc ? tc : c

  vn_ = map(g, vn)
  s = string(vn_...)
  if s[1] == '0'
    return -1
  else
    return parse(Int, s)
  end
end


function generate_replaceds(n:: Int, which :: Int) :: Vector{Int}
  return [replace_digits(n, which, to) for to ∈ 0:9]
end


function is_ok(n :: Int, which :: Int) :: Bool
  v = generate_replaceds(n, which)
  filtered = filter(isprime, v)
  len = length(filtered)
  return len == 8
end


function main() :: Nothing
  upper_limit = 10^7
  for n ∈ 56004:upper_limit
    for which ∈ 0:1
      if is_ok(n, which)
        println(n)
        return nothing
      end
    end
  end

  println(-1)
  return nothing
end


@time main()
