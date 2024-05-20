main :: IO ()
main = print . length $ [0 | n <-[1..upperLimit], convergeTo89 n]


convergeTo89 :: Integer -> Bool
convergeTo89 n
    | n == 1    = False
    | n == 89   = True
    | otherwise = convergeTo89 n'
    where n' = digitSquareSum n
 

digitSquareSum :: Integer -> Integer
digitSquareSum n
    | n < 10    = n^2
    | otherwise = r^2 + digitSquareSum m
    where
        r = n `mod` 10
        m = n `div` 10 


upperLimit :: Integer
upperLimit = 10^7
