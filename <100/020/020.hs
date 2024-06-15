main :: IO ()
main = print $ solve start


solve :: Integer -> Integer
solve = digitSum . factorial


factorial:: Integer -> Integer
factorial 1 = 1
factorial n = n * factorial (n-1)


digitSum:: Integer -> Integer
digitSum 0 = 0
digitSum n = a + digitSum n'
    where
        a  = n `mod` 10
        n' = n `div` 10

start :: Integer
start:: Integer = 100
