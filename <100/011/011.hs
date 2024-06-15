import qualified Data.Vector as V
import Data.Maybe ( isNothing )
import System.IO ( hClose, hGetContents, openFile, IOMode(ReadMode) )
type Filed = V.Vector (V.Vector Int)
type Row = Int
type Col = Int
type Direction = Int


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contetns <- hGetContents handle
    let table = V.fromList . map  (V.fromList . map read . words) . lines $ contetns
    let check = check' table
    let answer = foldl check 0 allPossibilites
    print answer
    hClose handle


allPossibilites :: [(Row, Col, Direction)]
allPossibilites = [(r, c, d) | r <- [0..19], c <- [0..19], d <- [0..3]]


check' :: Filed -> Int -> (Row, Col, Direction) -> Int
check' f ref (r, c, d)
    | outOfRange = ref
    | otherwise  = max ref ans
    where
        outOfRange = isNothing maybeVal
        maybeVal   = product <$> sequenceA justs
        justs      = [f `at` (r', c') | k <- [0..3], let r' = r + k * (drs V.! d), let c' = c + k * (dcs V.! d)]
        Just ans   = maybeVal


at :: Filed -> (Row, Col) -> Maybe Int
at f (r, c) = do
                vec <- f V.!? r
                vec V.!? c  


----------------------- supplemental -----------------------
drs :: V.Vector Direction
drs = V.fromList [-1,  0,  1,  1]


dcs :: V.Vector Direction
dcs = V.fromList [ 1,  1,  1,  0]


filename :: String
filename = "011.txt"
