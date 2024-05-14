main :: IO ()
main = print $ maximum [digitSum (a^b) | a <- [1..99], b <- [1..99]]


digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = r + digitSum n'
    where
        r  = n `mod` 10
        n' = n `div` 10
