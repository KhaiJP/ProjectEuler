import Data.Numbers.Primes ( isPrime )
import Data.List ( sort )


main :: IO ()
main = print $ head [n | n <- [7654321,7654319..], isPrime n, isPandigital n]


isPandigital :: (Show int, Integral int) => int -> Bool
isPandigital = and . zipWith (==) ['1'..] . sort . show
