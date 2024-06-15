main :: IO ()
main = print $ head [hex | n <- [144..], let hex = hexagonalProd n, isTriAndPent hex]


isTriAndPent :: Integral int => int -> Bool
isTriAndPent n = isTri && isPent
    where
        isTri  = isTriangle n
        isPent = isPentagonal n


isTriangle :: Integral int => int -> Bool
isTriangle = hasInverse triangleProd


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


----------------------- supplemental -----------------------
triangleProd :: Integral int => int -> int
triangleProd n = n * (n + 1) `div` 2


pentagonalProd :: Integral int => int -> int
pentagonalProd n = n * (3*n - 1) `div` 2


hexagonalProd :: Integral int => int -> int
hexagonalProd n = n * (2*n - 1)
