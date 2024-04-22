main = print $ sum [length . powerfuls $ a | a <- [1..upperLimit]]

-- make a^p be p-digit, a^p < 10^p must hold -> a <= 9
upperLimit = 9

-- collecting powers p that a^p are p-digit  
powerfuls :: Integer -> [Integer]
powerfuls a = takeWhile (isPowerful a) [p | p <- [1..]]

-- calculate if a^p is p-digit number
isPowerful :: Integer -> Integer -> Bool
isPowerful a p = (numDigits (a^p) == p)

-- calculate number of digits of given n. 0 is defined to be 0-digit number
numDigits :: Integer -> Integer
numDigits n
    | n == 0    = 0
    | n < 10    = 1
    | otherwise = (+1) . numDigits $ div n 10
