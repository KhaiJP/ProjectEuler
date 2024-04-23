import Math.NumberTheory.ArithmeticFunctions
main = print $ sum . (map totient) $ [2..upperLimit]
upperLimit :: Int = 10^6
