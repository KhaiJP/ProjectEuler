main = print $ solve start

solve = digitSum . factorial

factorial:: Integer -> Integer
factorial 1 = 1
factorial n = n * (factorial (n-1))

digitSum:: Integer -> Integer
digitSum 0 = 0
digitSum n = addFirstDigit $ digitSum $ div n 10
    where addFirstDigit = addGenerator $ mod n 10

start:: Integer = 100
addGenerator = \x -> (+x)
