import Data.Numbers.Primes ( isPrime )


main :: IO ()
main = print . sum . take target . filter (\n -> (n-1) `mod` fA n == 0) $ [n | n <- [9, 11..], n `mod` 5 /= 0, isComposite n]


fA :: Int -> Int
fA = fA' 1 1


fA' :: Int -> Int -> Int -> Int
fA' l a m
    | 10^6 < l  = l
    | a == 0    = l
    | otherwise = fA' l' a' m
    where
        l' = l + 1
        a' = (10 * a + 1) `mod` m


isComposite :: Int -> Bool
isComposite = not . isPrime


target :: Int
target = 25
