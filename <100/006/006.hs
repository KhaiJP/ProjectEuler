main = print $ diffSquares start terminal


start = 1
terminal =  100

diffSquares s t = (squareSum s t) - (sumSquares s t)

squareSum  s t = square $ sum [ x | x <- [s..t]]
sumSquares s t = sum [square x | x <- [s..t]]

square:: Num a => a -> a
square x = x * x
