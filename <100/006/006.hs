main :: IO ()
main = print $ diffSquares start terminal


diffSquares :: (Num a, Enum a) => a -> a -> a
diffSquares s t = squareSum s t - sumSquares s t


squareSum :: (Num a, Enum a) => a -> a -> a
squareSum  s t = square . sum $ [s..t]


sumSquares :: (Num a, Enum a) => a -> a -> a
sumSquares s t = sum [square x | x <- [s..t]]


square:: Num a => a -> a
square x = x * x


----------------------- supplemental -----------------------
start :: Int
start = 1


terminal :: Int
terminal =  100
