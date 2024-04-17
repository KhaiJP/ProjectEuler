import Data.Numbers.Primes

main = print $ sum $ takeWhile (<upper_limit) primes
upper_limit = 2000000
