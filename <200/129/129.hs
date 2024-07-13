main :: IO ()
main = print . head . filter (\n -> target < fA n) $ [n | n <- [1000001, 1000003..], n `mod` 5 /= 0]


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


target :: Int
target = 10^6
