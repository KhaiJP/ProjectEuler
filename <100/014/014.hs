import Data.List


main = print $ fst $ last sortedCollatzs

sortedCollatzs = sortOn snd collatzList
collatzList    = take upper_limit [(n, collatz n) | n <- [1..]]

collatz:: Int -> Int
collatz n
    | n <= 1        = n
    | mod n 2 == 0  = (+1) . collatz $ div n 2
    | otherwise     = (+1) . collatz $ 3*n + 1

upper_limit = 10^6
