import GHC.Base (modInt)

-- solve in framework of Int, not Integer
main :: IO ()
main = print $ 1 + foldl (\n m -> modInt10000000000 (2*n)) 28433 [1..7830457]

modInt10000000000 :: Int -> Int
modInt10000000000 = flip modInt (10^10)


-- simpler version
-- main :: IO ()
-- main = print answer

-- answer:: Integer
-- answer = (28433 * 2^7830457 + 1) `mod` (10^10)
