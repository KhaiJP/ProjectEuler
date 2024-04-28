main = print $ digitSum . fst . reproduceContinuedFraction . makeE $ 100

-- returns a quatient (numerator, denominator) which is equivalent to xs, continued fraction 
reproduceContinuedFraction :: [Integer] -> (Integer, Integer)
reproduceContinuedFraction = reproduceContinuedFraction' (0, 1) . reverse 

-- the body of the reproducing process
reproduceContinuedFraction' :: (Integer, Integer) -> [Integer] -> (Integer, Integer)
reproduceContinuedFraction' (n, d) []     = (d, n)
reproduceContinuedFraction' (n, d) (x:xs) = reproduceContinuedFraction' (n', d') xs
    where
        n' = div n_ hcf
        d' = div d_ hcf
        n_ = d
        d_ = d*x + n
        hcf = gcd n_ d_

-- returns Euler's number e in continued fraction style with length n
makeE :: Integer -> [Integer]
makeE = makeE' 0

-- returns Euler's number e in continued fraction style
makeE' :: Integer -> Integer -> [Integer]
makeE' l n
    | n == 0           = []
    | l == 0           = 2 : next
    | l == 1           = 1 : next
    | l == 2           = 2 : next
    | mod (l-3) 3 == 2 = k : next
    | otherwise        = 1 : next
    where
        next = makeE' (l+1) (n-1) 
        k    = 2 * (div (l-3) 3 + 2)

digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = r + digitSum m
    where
        r = mod n 10
        m = div n 10
