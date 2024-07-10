import Data.Numbers.Primes ( primes )


-- naive solution, taking roughly 15 seconds
main :: IO ()
main = print . fst . head . filter isOK $ zip [1..(10^6)] primes


isOK :: (Integer, Integer) -> Bool
isOK (n, p) = remainder > target
    where
        remainder = summation `mod` modulus
        summation = (p-1)^n + (p+1)^n
        modulus   = p^2


target :: Integer
target = 10^10
