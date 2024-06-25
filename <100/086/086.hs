main :: IO ()
main = print . length . takeWhile (<= target) $ numIntShortestPaths


-- prefix sum part; numIntShortestPaths !! c -> number of integer shortest paths up to M = c 
numIntShortestPaths :: [Int]
numIntShortestPaths = scanl update' 0 [1..]


update' :: Int -> Int -> Int
update' s c = s + countIntShortestPaths c

-- counting #{\eta_c} for given c
countIntShortestPaths :: Int -> Int
countIntShortestPaths c = sum [countIntShortestPaths' (eta, c) | eta <- [1..(2*c)]]


-- counting #{(a, b)} for given \eta_c and c
countIntShortestPaths' :: (Int, Int) -> Int
countIntShortestPaths' (eta, c)
    | notSquared sq = 0
    | eta <= c + 1  = eta `div` 2
    | otherwise     = eta `div` 2 - (eta - c - 1)
    where sq = eta^2 + c^2


target :: Int
target = 1*10^6



----------------------- supplemental -----------------------
notSquared :: Int -> Bool
notSquared x = (/=) x $ (^2) . sqrt' $ x


sqrt' :: Int -> Int
sqrt' = getIntInverse (^2) 0 (10^8)


getIntInverse :: (Int -> Int) -> Int -> Int -> Int -> Int
getIntInverse f smaller bigger target
    | gap == 1      = smaller
    | f m <= target = getIntInverse f m bigger target
    | otherwise     = getIntInverse f smaller m target
    where
        gap = bigger - smaller
        m   = (bigger + smaller) `div` 2
