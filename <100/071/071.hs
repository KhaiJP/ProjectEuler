import Data.Ratio
import qualified Data.Set as S
type Frac = Ratio Int
type Set  = S.Set Frac


main :: IO ()
main = print $ numerator . S.findMax $ goodNumerators 


goodNumerators :: Set
goodNumerators = findSet 9 S.empty


findSet :: Int -> Set -> Set
findSet d s
    | d > upperLimit = s
    | otherwise      = findSet (d+1) s'
    where
        s' = S.insert (n%d) s
        n  = findNumerator n' d
        n' = (3*d) `div` 7


findNumerator :: Int -> Int -> Int
findNumerator n d
    | isOK      = n
    | otherwise = findNumerator (n-1) d
    where
        isOK  = cond1 && cond2
        cond1 = gcd n d == 1
        cond2 = (n%d) < upperBound 


upperBound :: Frac
upperBound = 3 % 7
upperLimit :: Int
upperLimit = 10^6
