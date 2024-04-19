import Data.Numbers.Primes
import Data.List


main = print $ sum [ n | n <- [1..upper_limit], isAmicable n]

upper_limit = 10^4 - 1

isAmicable :: Int -> Bool
isAmicable n = dn /= n && d dn == n
    where dn  = d n
          d 0 = 0
          d x = divisorsSum x - x

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
