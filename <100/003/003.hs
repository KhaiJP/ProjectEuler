main = print $ findMaxDiv 1 target

target:: Int = 600851475143


findMaxDiv:: Int -> Int -> Int
findMaxDiv i n
    | i * i > n   = -1
    | mod n i > 0 = findMaxDiv (i+1) n
    | isPrime i   = max i $ findMaxDiv (i+1) n
    | otherwise   = findMaxDiv (i+1) n


isPrime:: Int -> Bool
isPrime 2 = True
isPrime n
    | n < 2          = False
    | (mod n 2) == 0 = False
    | otherwise      = naive 3 n
    where naive:: Int -> Int -> Bool
          naive i n
            | i * i > n    = True
            | mod n i == 0 = False
            | otherwise    = naive (i+2) n
