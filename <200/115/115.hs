main :: IO ()
main = print . fst . head . filter ((target <) . snd) $ zip [0..] memo


count :: Int -> Int
count n
    | n < m     = memo !! n
    | otherwise = 2*a - b + c
    where
        a = memo !! (n-1)
        b = memo !! (n-2)
        c = memo !! (n-m-1)


memo :: [Int]
memo = replicate m 1 ++ [2] ++ [count n | n <- [(m+1)..]]


m :: Int
m = 50


target :: Int
target = 10^6
