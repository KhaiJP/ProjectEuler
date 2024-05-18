import Data.Bits
import Data.Maybe ( isNothing )
import qualified Data.Map.Strict as M
type RTriangle = (Int, Int, Int)
type Map = M.Map Int Int


main :: IO ()
main = print . length . filter (\(_, c) -> c == 1) . M.toList $ wireLengthCount


wireLengthCount :: Map
wireLengthCount = count 1 1 M.empty


count :: Int -> Int -> Map -> Map
count n m mp
    | n <= m      = count (n+1) 1 mp
    | badTriangle = count n (m+1) mp
    | hasReached  = mp
    | otherwise   = count n (m+1) mp'
    where
        badTriangle    = isNothing trp
        hasReached     = n*n >= upperLimit
        trp            = primitivePythagorean n m
        Just (a, b, c) = trp
        mp'            = foldl update mp sideLengths
        sideLengths    = takeWhile (<= upperLimit) $ map (*baseLength) [1..]
        baseLength     = a + b + c


update :: Map -> Int -> Map
update mp sideLength = if M.member sideLength mp
                        then M.update (\x -> Just (x+1)) sideLength mp
                        else M.insert sideLength 1 mp


primitivePythagorean :: Int -> Int -> Maybe RTriangle
primitivePythagorean n m
    | isPrimitive = Just (a, b, c)
    | otherwise   = Nothing
    where
        isPrimitive = coprime && evenOdd
        coprime     = gcd n m == 1
        evenOdd     = (n .&. 1) /= (m .&. 1)
        a' = n^2 - m^2
        b' = 2 * n * m
        a  = min a' b'
        b  = max a' b'
        c  = n^2 + m^2


upperLimit :: Int
upperLimit = 1500000
