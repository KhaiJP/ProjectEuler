import Data.Char ( digitToInt )

main :: IO ()
main = print . sum $ [sum100Digits n | n <- [1..100], not . isSquared $ n]


-- collect 100 digits
sum100Digits :: Integer -> Int
sum100Digits = sum . take 100 . map digitToInt . show . sqrt100f


-- to find 100 digits, sqrt of n*10^210 is calculated instread.
sqrt100f :: Integer -> Integer
sqrt100f n = sqrt' (n * 10^210)


-- sqrt <--> (^2) are inverse vice verssa
sqrt' :: Integer -> Integer
sqrt' = binarySearch (^2) 0 (10^220)


-- find sup{x | x in N, f x <= target}. note f must be monotonically increasing. -> inverse of f
binarySearch :: (Integer -> Integer) -> Integer -> Integer -> Integer -> Integer
binarySearch f smaller bigger target
    | gap == 1      = smaller
    | f m <= target = binarySearch f m bigger target
    | otherwise     = binarySearch f smaller m target
    where
        gap = bigger - smaller
        m   = (bigger + smaller) `div` 2


isSquared :: Integer -> Bool
isSquared x = (==) x $ (^2) . sqrt' $ x
