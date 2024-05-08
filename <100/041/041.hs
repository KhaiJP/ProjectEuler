import Data.Numbers.Primes (isPrime)
import Data.Char (ord, chr)
import Data.List (sort)


main :: IO ()
main = print $ head [n | n <- [7654321,7654319..], isPrime n, isPandigital n]


isPandigital :: Show p => p -> Bool
isPandigital n = s == t
    where
        s = sort . show $ n
        t = map f [1..l]
        l = length s
        f = chr . (+ ord '0') -- 1 -> '1'
