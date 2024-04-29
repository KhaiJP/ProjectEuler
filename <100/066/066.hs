import Numeric.QuadraticIrrational
import Text.Regex
import Data.List
import Data.Ratio (numerator, denominator)


main = print $ maximumAt answers

answers = [x | d <- [0..upperLimit], let (x, _) = solvePellEq d]

solvePellEq :: Integer -> (Numerator, Denominator)
solvePellEq n = (x, y)
    where
        (x, y)   = if x'^2 - n*y'^2 == 1 then (x', y') else (-1, 0)
        x'       = numerator approxCF
        y'       = denominator approxCF
        approxCF = if odd period 
                     then continuedFractionApproximate (2*period-1) cf
                     else continuedFractionApproximate period cf
        period   = periodQI q
        cf       = qiToContinuedFraction q
        q        = qi 0 1 n 1

periodQI :: QI -> Int
periodQI q
    | isSquare  = 0
    | otherwise = period
    where
        isSquare = q' == q
        q'       = qi (fst cf) 0 0 1
        cf       = qiToContinuedFraction q
        period   = length . splitRegex (mkRegex ",") . last . words . show . snd $ cf


maximumAt :: Ord a => [a] -> Maybe Int
maximumAt list = elemIndex ( maximum list ) list

type Numerator   = Integer
type Denominator = Integer
upperLimit :: Integer = 1000
