import Data.Char ( digitToInt )
import Data.List ( intercalate )


main :: IO ()
main = print $ product $ zipWith extract s [1..10^upperLimit]


s :: String
s = intercalate "" [show n | n <- [1..]]


extract :: (Num t2, Ord t2) => Char -> t2 -> Int
extract c n
    | powerOf10 n 0 = digitToInt c
    | otherwise     = 1


powerOf10 :: (Integral t1, Num t2, Ord t2) => t2 -> t1 -> Bool
powerOf10 n p
    | 10^p > n  = False
    | 10^p == n = True
    | otherwise = powerOf10 n (p+1)


upperLimit :: Int
upperLimit = 6
