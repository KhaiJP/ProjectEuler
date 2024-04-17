import Data.Numbers.Primes
import Data.List


main = print $ head goodNumbers

goodNumbers  = [triangleProd n | n <- [1..], enjoyCondition . numDivisors $ triangleProd n]
triangleProd = \n -> n * (n+1) `div` 2
numDivisors  =  \n -> product $ map lengthPlus1 $ group $ primeFactors n

enjoyCondition = (> target)
lengthPlus1    = \xs -> length xs + 1
target         = 500
