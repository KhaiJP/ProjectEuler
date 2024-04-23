main = print $ sum numProperFractions

numProperFractions = map countPropers [4..upperLimit]

-- count number of proper fractions q whose denominator is d and 1/3 < q < 1/2
countPropers :: Int -> Int
countPropers d = countPropers' d n 
    where n = if (d `mod` 2) == 0 then d `div` 2 - 1 else d `div` 2

-- count number of proper fractions q whose denominator is d(fixed) and numerator is n.
countPropers' :: Int -> Int -> Int
countPropers' d n
    | 3*n <= d   = 0
    | areCoPriem = countPropers' d (n-1) + 1
    | otherwise  = countPropers' d (n-1)
    where areCoPriem = (gcd d n == 1)

upperLimit = 12000
