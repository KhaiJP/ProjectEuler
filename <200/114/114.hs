main :: IO ()
main = print . count $ target


count :: Int -> Int
count n
    | n < 4     = memo !! n
    | otherwise = 2*a - b + c
    where
        a = memo !! (n-1)
        b = memo !! (n-2)
        c = memo !! (n-4)


memo :: [Int]
memo = [1, 1, 1, 2] ++ [count n | n <- [4..]]


target :: Int
target = 50
