main = print $ digitSum pow

digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = addFirstDigit $ digitSum $ div n 10
    where addFirstDigit = addGenerator $ mod n 10

addGenerator = \x -> (+x)
pow :: Integer  = base ^ 1000
base :: Integer = 2
