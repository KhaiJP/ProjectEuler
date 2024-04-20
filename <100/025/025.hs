main = print $ fibGenerator 1 1 3

target = 1000

fibGenerator :: Integer -> Integer -> Integer -> Integer
fibGenerator f1 f2 n
    | l >= target = n
    | otherwise   = fibGenerator f2 f3 $ n+1
    where
        f3 = f1 + f2
        l  = numDigits f3

numDigits :: Integer -> Integer
numDigits n
    | n < 10    = 1
    | otherwise = (+1) . numDigits $ div n 10
