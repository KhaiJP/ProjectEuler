main :: IO ()
main = print . count $ target


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
m = 3


target :: Int
target = 50
