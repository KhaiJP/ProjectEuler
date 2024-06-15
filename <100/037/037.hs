import Data.Numbers.Primes ( isPrime )


main :: IO ()
main = print $ sum . take target $ [n | n <- [11..], all isPrime $ family n]


family :: Int -> [Int]
family n = [n] ++ lefts ++ rights
    where
        lefts  = map read . lefts' . show $ n
        rights = map read . rights' . show $ n


lefts' :: String -> [String]
lefts' [c]  = []
lefts' (c:cs) = cs : lefts' cs


rights' :: String -> [String]
rights' [c] = []
rights' s = s' : rights' s'
    where s' = init s


target :: Int
target = 11
