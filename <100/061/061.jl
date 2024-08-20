using Combinatorics


triangle_prod(n :: Int) :: Int = n * (n+1) ÷ 2
square_prod(n :: Int) :: Int = n * n
pentagonal_prod(n :: Int) :: Int = n * (3*n-1) ÷ 2
hexagonal_prod(n :: Int) :: Int = n * (2*n-1)
heptagonal_prod(n :: Int) :: Int = n * (5*n-3) ÷ 2
octagonal_prod(n :: Int) :: Int = n * (3*n-2)


function eval_get_vect(f :: Function)
  return [f(n) for n ∈ 1:200 if 1000 ≤ f(n) && f(n) ≤ 9999]
end


function eval_geo_vects() :: Vector{Vector{Int}}
  fs = [triangle_prod, square_prod, pentagonal_prod, hexagonal_prod, heptagonal_prod, octagonal_prod]
  return map(f -> eval_get_vect(f), fs)
end


function is_chain(pre :: Int, now :: Int) :: Bool
  if pre == 0
    return true
  end
  tail = pre % 100
  head = now ÷ 100
  return tail == head
end



function dfs(v_idx :: Vector{Int},
             geo_vects :: Vector{Vector{Int}},
             chains :: Vector{Vector{Int}},
             chain :: Vector{Int},
             n :: Int = 1,
             pre :: Int = 0
) :: Nothing
  if n == length(v_idx) + 1
    if is_chain(chain[end], chain[begin])
      tmp = [a for a ∈ chain]
      push!(chains, tmp)
    end
    return nothing
  end

  gv = filter(x -> is_chain(pre, x), geo_vects[v_idx[n]])
  for a ∈ gv
    push!(chain, a)
    dfs(v_idx, geo_vects, chains, chain, n+1, a)
    pop!(chain)
  end

  return nothing
end


function main() :: Nothing
  geo_vects = eval_geo_vects()
  v_idx_ :: Vector{Int} = [j for j ∈ 2:length(geo_vects)]
  chains :: Vector{Vector{Int}} = []

  perms = permutations(v_idx_)
  for v_idx ∈ perms
    pushfirst!(v_idx, 1)
    chain :: Vector{Int} = []
    dfs(v_idx, geo_vects, chains, chain)
  end

  answer = sum([sum(chain) for chain ∈ chains])
  println(answer)
  return nothing
end


@time main()
ß