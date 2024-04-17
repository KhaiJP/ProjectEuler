import Data.Numbers.Primes

main = print $ cntPrimes 1 primes


target = 10001
cntPrimes n (x:xs)
    | n == target = x
    | otherwise   = cntPrimes (n+1) xs
