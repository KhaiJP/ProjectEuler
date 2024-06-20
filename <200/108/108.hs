import Data.Numbers.Primes ( primeFactors )
import Data.List ( group )


main :: IO ()
main = print . head . filter isOK $ [1..(10^6)]


isOK :: Int -> Bool
isOK n = numDivisors (n^2) > 2*target


numDivisors :: Int -> Int
numDivisors = product . map ( (+1) . length ) . group . primeFactors


target :: Int
target = 10^3
