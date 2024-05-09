-- note this algo implementation is slow for haskell
main :: IO ()
main = print $ solve 2 1 (10^9)


solve :: Int -> Int -> Int -> Int
solve k j answer
    | k == upperLimit = answer
    | j == 0          = solve (k+1) k answer
    | answer < diff   = solve (k+1) k answer
    | areOK           = solve (k+1) k diff
    | otherwise       = solve k (j-1) answer
    where
        diff    = pk - pj
        sum'    = pk + pj
        areOK   = isPentagonal diff && isPentagonal sum'
        pk      = pentagonalProd k
        pj      = pentagonalProd j


isPentagonal :: Integral int => int -> Bool
isPentagonal = hasInverse pentagonalProd


-- returns if n can be produced by monotically increasing function f :: int -> int
hasInverse :: Integral int => (int -> int) -> int -> Bool
hasInverse f n = n == f lb
    where lb = lowerBoundInverse' 0 (10^9) f n


-- returns Sup{x | f x <= n, x in n}
lowerBoundInverse' :: Integral int => int -> int -> (int -> int) -> int -> int
lowerBoundInverse' smaller bigger f n
    | gap == 1   = smaller
    | f mid <= n = lowerBoundInverse' mid bigger f n
    | otherwise  = lowerBoundInverse' smaller mid f n
    where
        gap = bigger - smaller
        mid = (bigger + smaller) `div` 2


pentagonalProd :: Integral int => int -> int
pentagonalProd n = n*(3*n-1) `div` 2


upperLimit :: Int
upperLimit = 10^4
