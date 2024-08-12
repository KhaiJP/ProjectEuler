import qualified Data.Map.Strict as M ( Map, fromList, toList, update )
import Data.List ( maximumBy )
import Control.Monad ( (<=<) )
import Data.Maybe ( isNothing )
type Triangle = (Int, Int, Int)
type Memo = M.Map Int Int


main :: IO ()
main = print . whichKeyGeneratesMaxValue . foldl update' initMemo $ [(m, n) | n <- [1..upperLimit], m <- [n..upperLimit]]
    where initMemo = M.fromList [(p, 0) | p <- [1..upperLimit]]


update' :: Memo -> (Int, Int) -> Memo
update' memo tp
    | isBadTuple = memo
    | otherwise  = foldl (flip $ M.update (Just . (+1))) memo ps
    where
        isBadTuple = isNothing maybeP
        maybeP     = perimeter <=< pythagoreanGenerator $ tp
        ps         = takeWhile (<= upperLimit) [n*p | n <- [1..]]
        Just p     = maybeP


pythagoreanGenerator :: (Int, Int) -> Maybe Triangle
pythagoreanGenerator (m, n)
    | m <= n       = Nothing
    | gcd m n /= 1 = Nothing
    | bothOdd      = Nothing
    | otherwise    = Just (m^2 - n^2, 2*m*n, m^2 + n^2)
    where bothOdd = odd m && odd n


perimeter :: Triangle -> Maybe Int
perimeter (a, b, c)
    | upperLimit < p = Nothing
    | otherwise      = Just p
    where p = a + b + c


whichKeyGeneratesMaxValue :: Memo -> Int
whichKeyGeneratesMaxValue = fst . maximumBy (\(_,a) (_,b) -> compare a b) . M.toList


upperLimit :: Int
upperLimit = 1000
