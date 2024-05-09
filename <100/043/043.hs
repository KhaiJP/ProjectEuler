import Data.List


main :: IO ()
main = print $ sum . map stringToInt . filter check $ pandigitals


check :: String -> Bool
check = allDivisible . map stringToInt . map' slices 


allDivisible :: [Int] -> Bool
allDivisible nums = all (==0) $ zipWith (flip mod) ref nums
    where ref = [2, 3, 5, 7, 11, 13, 17]


pandigitals :: [String]
pandigitals = permutations pand


split :: String -> [String]
split s = [s]


slices :: [[a] -> [a]]
slices = map (\n -> slice n (n+2)) [1..7]
slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)


map' :: [a -> b] -> a -> [b]
map' fs a = map ($ a) fs


stringToInt :: String -> Int
stringToInt = read


pand :: String
pand = "0123456789"
