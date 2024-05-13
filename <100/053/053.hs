main :: IO ()
main = print $ length [1 | n <- [1..100], r <- [0..n], n `nCr` r > bound]


nCr :: Integer -> Integer -> Integer
nCr n r = div (fact n) $ fact r * fact (n-r)


fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n-1)


bound :: Integer
bound = 10^6
