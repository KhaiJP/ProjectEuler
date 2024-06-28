import Data.Numbers.Primes ( isPrime )
import Data.List ( elem, group )


main :: IO ()
main = print . head . filter isTarget $ range


-- check if n is a family of the desired numbers
isTarget :: Int -> Bool
isTarget n = result
    where
        -- if length place /= 3k, then the replacements never contain 8 primes
        result = or [check nString places | places <- map findPlaces ['0'..'9'], length places == 3]
        nString = show n
        findPlaces :: Char -> [Int]
        findPlaces t = filter (\n -> nString!!n == t) [0..(numLength-1)]


-- 's' is a number in string and 'places' are digits to be replaced.
check :: String -> [Int] -> Bool
check s places = lenPrimes == targetLength
    where
        lenPrimes  = length . filter isPrime $ replaces 
        replaces   = replace s places


-- return replacement family of 's' at digits 'placese'
-- replace "56003" [2, 3] = [56003, 56113, 56223, 56333, 56443, 56553, 56663, 56773, 56883, 56993]
replace :: String -> [Int] -> [Int]
replace s places = map tmpFunc ['0'..'9']
    where
        tmpFunc :: Char -> Int
        tmpFunc k = read' [if j `elem` places then k else c | (c, j) <- zip s [0..]]



----------------------- supplemental -----------------------
range::[Int]
range = [10^(numLength-1)..]


-- expecting the answer lies in 10^5 ~ 10^6
numLength :: Int
numLength = 6


-- 8 primes must be found by the replacement
targetLength :: Int
targetLength = 8


-- returned value 1 can be replaced by whatever non-prime
read' :: String -> Int
read' [] = 1
read' str@(c:cs)
    | c == '0'  = 1
    | otherwise = read str
