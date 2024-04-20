import Data.Numbers.Primes
import Data.List


main = print $ snd . last . (sortOn fst) $ primeLengths

primeLengths = [ (primeLength a b, a * b) | a <- [-1000..1000], b <- [-1000..1000]]

-- find n that all [ f k  | k <- [0..(n-1)] ] are primes
primeLength :: Int -> Int -> Int
primeLength a b  = findLength f 0
    where f = quadraticGenerator a b

-- find n that all [ f k  | k <- [0..(n-1)] ] are primes
findLength :: (Int -> Int) -> Int -> Int
findLength f n
    | isPrime . f $ n = findLength f (n+1)
    | otherwise       = n

-- generating a quadratic function
quadraticGenerator :: Int -> Int -> (Int -> Int)
quadraticGenerator a b = \n -> n^2 + a*n + b
