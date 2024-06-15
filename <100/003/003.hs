import Data.Numbers.Primes ( isPrime )


main :: IO ()
main = print $ findMaxDiv target


findMaxDiv :: Int -> Int
findMaxDiv n
    | isPrime n = n
    | otherwise = findMaxDiv' 1 2 n


findMaxDiv':: Int -> Int -> Int -> Int
findMaxDiv' i m n
    | i > n       = m
    | mod n i > 0 = findMaxDiv' (i+1) m n
    | isPrime i   = findMaxDiv' (i+1) i (n `div` i)
    | otherwise   = findMaxDiv' (i+1) m (n `div` i)


target :: Int
target:: Int = 600851475143
