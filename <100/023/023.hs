import Data.Numbers.Primes ( primeFactors )
import Data.List ( group )
import Data.List.Unique ( sortUniq )


main :: IO ()
main = print $ total - multi
  where
    total     = upperLimit * (upperLimit+1) `div` 2
    multi     = sum . sortUniq $ [n+m | n <- abundants, m <- abundants, n+m <= upperLimit]
    abundants = [n | n <- [1..upperLimit], isAbundant n]


isAbundant :: Int -> Bool
isAbundant n = properSum n > n


properSum :: Int -> Int
properSum n = divisorsSum n - n


divisorsSum :: Int -> Int
divisorsSum = product . mPrimeSum . primeFactors'


-- if given number is 72 = 2^3 * 3^2, this function returns [ [2, 2, 2], [3, 3] ]
primeFactors' :: Int -> [[Int]]
primeFactors' = group . primeFactors


-- if given [[Int]] is [ [2, 2, 2], [3, 3] ], this function returns [15, 13]
mPrimeSum :: [[Int]] -> [Int]
mPrimeSum = map primeSum


-- [p, ... , p] with length n represents p^n. primeSum calculates \sum_{k=0}^n p^k
primeSum :: [Int] -> Int
primeSum [] = 0
primeSum xs =  (x^(l+1) - 1) `div` (x - 1)
    where l = length xs
          x = head xs


upperLimit :: Int
upperLimit = 28123
