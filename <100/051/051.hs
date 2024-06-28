import Data.Numbers.Primes ( isPrime )
import Data.List ( elem, group )


main :: IO ()
main = print . safeHead . filter isTarget $ range


-- check if n is a family of the desired numbers
isTarget :: Int -> Bool
isTarget n = result
    where
        -- if length place /= 3k, then the replacements never contain 8 primes
        result = or [check nString places | places <- map (findPlaces nString) ['0'..'9'], length places == 3]
        nString = show n
        findPlaces :: String -> Char -> [Int]
        findPlaces s t = filter (\n -> s!!n == t) [0..(numLength-1)]


-- s = show num. places is digits to replace. is the numbers in such digits are not unique then False.
check :: String -> [Int] -> Bool
check s places = firstCheck && lenPrimes == targetLength
    where
        firstCheck = (length . group $ [s!!p | p <- places]) == 1 
        lenPrimes  = length . filter isPrime $ replaces 
        replaces   = replace s places


-- replece s = show num at places
replace :: String -> [Int] -> [Int]
replace s ps = map tmpFunc ['0'..'9']
    where
        tmpFunc :: Char -> Int
        tmpFunc k = read' [if j `elem` ps then k else c | (c, j) <- zip s [0..]]



----------------------- supplemental -----------------------
range::[Int]
range = [10^(numLength-1)..10^numLength-1]


-- expecting the answer lies in 10^5 ~ 10^6
numLength :: Int
numLength = 6


-- 8 primes must be found by the replacement
targetLength :: Int
targetLength = 8


safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x


-- returned value 1 can be replaced by whatever non-prime
read' :: String -> Int
read' [] = 1
read' str@(c:cs)
    | c == '0'  = 1
    | otherwise = read str
