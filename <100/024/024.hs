import Data.List


main = print $ show' milth


show' :: [Int] -> String
show' []     = ""
show' (x:xs) = (show x) ++ (show' xs)

milth  = perms!!target
perms  = sort . permutations $ [0..9]
target = 999999

