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
    | l == 0           = 2 : makeE' (l+1) (n-1)
    | l == 1           = 1 : makeE' (l+1) (n-1)
    | l == 2           = 2 : makeE' (l+1) (n-1)
    | mod (l-3) 3 == 2 = k : makeE' (l+1) (n-1)
    | otherwise        = 1 : makeE' (l+1) (n-1)
    where
        k = 2 * (div (l-3) 3 + 2)

digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = a + digitSum m
    where
        a = mod n 10
        m = div n 10
