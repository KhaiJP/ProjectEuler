import Data.List ( sort, permutations )


main :: IO ()
main = putStrLn . concatMap show $ perms !! target


perms :: [[Int]]
perms  = sort . permutations $ [0..9]


target :: Int
target = 999999
