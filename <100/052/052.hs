import Data.List ( sort )


main :: IO ()
main = print $ head [x | x <- [1..], allIdentical . map (sort . show) . xTo6xs $ x]


allIdentical :: Eq a => [a] -> Bool
allIdentical []     = True
allIdentical [x]    = True
allIdentical (x:xs) = x == head xs && allIdentical xs


xTo6xs :: Integer -> [Integer]
xTo6xs x = map (\f -> f x) fs
    where fs = map (*) [1..6]
