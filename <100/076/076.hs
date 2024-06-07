main :: IO ()
main = print $ partition' 100 1 -1


partition' :: Int -> Int -> Int
partition' n k
    | k > n = 0
    | k == n = 1
    | otherwise = nk1 + nkk
    where
        nk1 = partMemo !! n !! (k+1)
        nkk = if k == 0
                then 0
                else partMemo !! (n-k) !! k


partMemo :: [[Int]]
partMemo = [[partition' n k | k <- [0..]] | n <- [0..]]
