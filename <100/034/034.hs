main :: IO ()
main = print $ sum [n | n <- [1..upperLimit], isOK n]


isOK :: Int -> Bool
isOK 1 = False
isOK 2 = False
isOK n = digitFactorial n == n


digitFactorial :: Int -> Int
digitFactorial n
    | n < 10 = factorial n
    | otherwise = (factorials !! m) + digitFactorial n'
    where
        m  = n `mod` 10
        n' = n `div` 10


factorials :: [Int]
factorials = [factorial n | n <- [0..9]]


factorial :: Int -> Int
factorial 0 = 1
factorial n = product [1..n]


upperLimit :: Int
upperLimit = 10^7
