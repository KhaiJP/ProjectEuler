-- naive solution; slow algorithm as it takes roughly 15 seconds to execute
main :: IO ()
main = print $ length . filter moreDigitsDenominator $ continuedFractions


moreDigitsDenominator :: (Integer, Integer) -> Bool
moreDigitsDenominator (denominator, numerator) = digitsD > digitsN
    where
        digitsD = length . show $ denominator
        digitsN = length . show $ numerator


-- continuedFractions!!n = [1, 2, ... , 2] with length n. note # of 1s is n-1, not n.
continuedFractions :: [(Integer, Integer)]
continuedFractions = [reproduceContinuedFraction $ take n cfSqrt2 | n <- [1..upperLimit]]


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


cfSqrt2 :: [Integer]
cfSqrt2 = 1 : repeat 2
upperLimit :: Int
upperLimit = 10^3
