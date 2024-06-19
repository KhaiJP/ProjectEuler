import Math.NumberTheory.Logarithms


-- naive algo: takes 1.3 minutes
main :: IO ()
main = print . snd . head . filter (bothPandigital . fst) $  zip fibonacci [1..]


bothPandigital :: Integer -> Bool
bothPandigital n = lastPandigital n && headPandigital n


headPandigital :: Integer -> Bool
headPandigital n = h == target
    where h = genPower . getHead $ n


lastPandigital :: Integer -> Bool
lastPandigital n = l == target
    where l = genPower n


-- genPower 123456789 = genPower 321654987 = genPower 987654321 = 1022
genPower :: Integer -> Int
genPower = genPower' 0 0


genPower' :: Int -> Int -> Integer -> Int
genPower' c s m
    | c == pandigitLen = s
    | otherwise        = genPower' c' s' m'
    where
        c' = c + 1
        m' = m `div` 10
        d  = m `mod` 10
        s' = s + 2^d

-- getHead 123456789000000000000 = 123456789, getHead 1234567 = 0
getHead :: Integer -> Integer
getHead n = h
    where
        h  = if p >= 0 then n `div` (10^p) else 0
        p  = p' - pandigitLen + 1
        p' = integerLog10 . fromIntegral $ n


----------------------- supplemental -----------------------
fibonacci :: [Integer]
fibonacci = [1, 1] ++ zipWith (+) fibonacci (tail fibonacci)


pandigitLen :: Int
pandigitLen = 9


target :: Int
target = 2^(pandigitLen+1) - 2
