import Data.Numbers.Primes


main :: IO ()
main = print $ length . filter (all isPrime) $ [rotGeneration n | n <- [1..upperLimit], isPrime n]

-- 1234 -> [2341, 3412, 4123, 1234]
rotGeneration :: Int -> [Int]
rotGeneration n = rotGeneration' ns l
    where
        ns = show n
        l  = length ns


rotGeneration' :: String -> Int -> [Int]
rotGeneration' _ 0  = []
rotGeneration' ns l = read ns' : rotGeneration' ns' l'
    where
        ns' = rotate' ns
        l'  = l - 1


-- make "AXXXXXX" -> "XXXXXXA"
rotate' :: String -> String
rotate' []     = []
rotate' (c:cs) = cs ++ [c]


upperLimit :: Int
upperLimit = 10^6 - 1
