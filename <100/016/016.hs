main :: IO ()
main = print . digitSum $ 2^1000


digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = a + digitSum n'
    where
        a  = n `mod` 10
        n' = n `div` 10
