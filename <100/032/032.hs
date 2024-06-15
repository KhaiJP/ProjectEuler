import Data.List
import qualified Data.Set as S


-- consider patterns that a*b = c is pandigital. for the sake of simplist we write n-digit as n-d.
-- 1 * 23456 = 23456, 9 * 234 = 2106-> 1-d * 5-d = 5-d or 6-d, 1-d * 3-d = 3-d or 4-d -> cannot be 1-9 pandigital.
-- by doing the same analysis, pandigital set is 1-d * 4-d = 4-d or 2-d * 3-d = 4*d.
main :: IO ()
main = print $ sum . S.fromList $ twoXthree ++ oneXfour


twoXthree :: [Integer]
twoXthree = [nm | n <- [12..98], m <- [123..987], let nm = n*m, isOK n m nm]


oneXfour :: [Integer]
oneXfour  = [nm | n <- [1..9], m <- [1234..9876], let nm = n*m, isOK n m nm]


isOK :: Integer -> Integer -> Integer -> Bool
isOK n m nm = isPandigital s
    where
        s     = strn ++ strm ++ strnm
        strn  = show n
        strm  = show m
        strnm = show nm 


isPandigital :: String -> Bool
isPandigital s = sorted == target
    where 
        sorted = sort s
        target = "123456789"
