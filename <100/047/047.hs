import Data.Numbers.Primes
import Data.List ( group )
import Data.List.Unique (uniq) 


main :: IO ()
main = print $ head [n | n <- [1..], isOK n]


isOK :: Int -> Bool
isOK = properQuad . consecutivePrimeFactors


consecutivePrimeFactors :: Int -> [[Int]]
consecutivePrimeFactors n = map primeFactors' [n..n+3]


primeFactors' :: Int -> [Int]
primeFactors' = map head . group . primeFactors


properQuad :: [[Int]] -> Bool
properQuad xss = allFour && areUniq
    where
        allFour = all checkLength xss
        areUniq = xss == uniq xss

checkLength :: [Int] -> Bool
checkLength xs = length xs == 4
