main = print $ sum [n | n <- [2..upperLimit], isOK n]

isOK = \n -> n == digit5thPowerSum n

digit5thPowerSum :: Int -> Int
digit5thPowerSum 0 = 0
digit5thPowerSum n = a^5 + digit5thPowerSum m
    where
        a = mod n 10
        m = div n 10

-- let us consider if there exists an upper limit of the number enjoying the condition.
-- the maximum m-digit number is apprently m * 9^5 < 60000m. to enjoy the condition,
-- this number must be less than 10^m (note 10^m is m+1-digit number).
-- for m = 6, 60000m = 360,000 > 1,000,000 = 10^m -> no number greater than 360000 enjoy the condition. 
upperLimit = 360000
