main :: IO ()
main = print $ sum [n | n <- [1..upperLimit], isOK n]


isOK :: Integer -> Bool
isOK 1 = False
isOK 2 = False
isOK n = digitFactorial n == n


digitFactorial :: Integer -> Integer
digitFactorial n
    | n < 10 = factorial n
    | otherwise = factorial m + digitFactorial n'
    where
        m  = n `mod` 10
        n' = n `div` 10


factorial :: Integer -> Integer
factorial 0 = 1
factorial n = product [1..n]


upperLimit :: Integer
upperLimit = 10^7
