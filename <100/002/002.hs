main = print $ fibSum f1 f2


f1:: Int = 1
f2:: Int = 2
upper_limit:: Int = 4000000


fibSum:: Int -> Int -> Int
fibSum f1 f2
    | f2 >= upper_limit = 0
    | mod f2 2 == 0     = f2 + fibSum f2 (f1+f2)
    | otherwise         =  0 + fibSum f2 (f1+f2)