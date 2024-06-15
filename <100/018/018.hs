import qualified Data.Map.Strict as M
import qualified Data.Vector as V
import System.IO ( hGetContents, openFile, IOMode(ReadMode) )
import Data.Maybe ( isNothing )
type Map = M.Map (Row, Col) Int
type Filed = V.Vector (V.Vector Int)
type Row = Int
type Col = Int


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let table = V.fromList . map (V.fromList . map read . words) . lines $ contents
    let foldFunc = foldFunc' table
    let initMap = M.insert (0, 0) a M.empty
                    where Just a = table `at` (0, 0)
    let resultMap = foldl foldFunc initMap allPossibilities
    let answer = maximum [resultMap M.! (14, c) | c <- [0..14]]
    print answer


allPossibilities :: [(Row, Col)]
allPossibilities = [(r, c) | r <- [0..14], c <- [0..r]]


foldFunc' :: Filed -> Map -> (Row, Col) -> Map
foldFunc' f m (r, c) = m''
    where
        m'  = update' f val (r+1, c) m
        m'' = update' f val (r+1, c+1) m'
        val = m M.! (r, c)


update' :: Filed -> Int -> (Row, Col) -> Map -> Map
update' f val (r, c) m
    | outOfRange = m
    | otherwise  = m'
    where
        outOfRange = isNothing ref
        Just val'  = ref
        ref = f `at` (r, c)
        m'  = if M.member (r, c) m
                then M.update (Just . max (val+val')) (r, c) m
                else M.insert (r, c) (val+val') m


at :: Filed -> (Row, Col) -> Maybe Int
at f (r, c) = do
                vec <- f V.!? r
                vec V.!? c


----------------------- supplemental -----------------------
filename :: String
filename = "018.txt"
