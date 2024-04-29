import Numeric.QuadraticIrrational
import Text.Regex

main = print $ sum [1 | n <- [1..upperLimit], hasOddPeriod n]

hasOddPeriod :: Integer -> Bool
hasOddPeriod n = odd . periodQI $ q
    where q = qi 0 1 n 1 

periodQI :: QI -> Int
periodQI q
    | isSquare  = 0
    | otherwise = period
    where
        isSquare = q' == q
        q'       = qi (fst cf) 0 0 1
        cf       = qiToContinuedFraction q
        period   = length . splitRegex (mkRegex ",") . last . words . show . snd $ cf

upperLimit :: Integer = 10^4
