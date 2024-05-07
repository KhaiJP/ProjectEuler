main = print $ sum [n | n <- [2..upperLimit], isOK n]

isOK n = n == digit5thPowerSum n

digit5thPowerSum :: Int -> Int
digit5thPowerSum 0 = 0
digit5thPowerSum n = a^5 + digit5thPowerSum m
    where
        a = mod n 10
        m = div n 10

-- let us consider if there exists an upper limit of the number enjoying the condition.
-- the maximum m-digit number is apprently m * 9^5 = 59049m bu< 60000m. to enjoy the condition,
-- this number must be greater than or equal to 10^(m-1) (note 10^m is m+1-digit number).
-- for m = 7, 60000m = 420,000 < 1,000,000 = 10^(m-1) -> m <= 6 -> no number greater than 360000 enjoy the condition. 
upperLimit = 360000
