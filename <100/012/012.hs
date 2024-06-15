import Data.Numbers.Primes ( primeFactors )
import Data.List ( group )


main :: IO ()
main = print $ head goodNumbers


goodNumbers :: [Int]
goodNumbers  = [tn | n <- [1..], let tn = triangleProd n, (>target) . numDivisors $ tn]


triangleProd :: Int -> Int
triangleProd n = n * (n+1) `div` 2


numDivisors :: Int -> Int
numDivisors = product . map lengthPlus1 . group . primeFactors


lengthPlus1 :: [a] -> Int
lengthPlus1 xs = length xs + 1


target :: Int
target = 500
