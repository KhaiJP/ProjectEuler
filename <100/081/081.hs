import qualified Data.Map.Strict as M
import qualified Data.Vector as V
import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import Data.Maybe ( isNothing )
import Text.Regex ( mkRegex, splitRegex )
type Field = V.Vector (V.Vector Int)
type Map   = M.Map (Row, Col) Int
type Row   = Int
type Col   = Int


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let table :: Field = V.fromList . map (V.fromList . map read . splitComma) . words $ contents
    let foldFunc = foldFunc' table
    let initMap  = M.update (\_ -> table `at` (0, 0)) (0, 0) initMap' 
    let resultMap = foldl foldFunc initMap allPossibilities
    print $ resultMap M.!? (size', size')
    hClose handle


allPossibilities :: [(Row, Col)]
allPossibilities = [(r, c) | r <- [0..size'], c <- [0..size']]


foldFunc' :: Field -> Map -> (Row, Col) -> Map
foldFunc' f m (r, c) = m''
    where
        m'  = update' f (r+1, c) e m
        m'' = update' f (r, c+1) e m'
        e   = m M.! (r, c)


update' :: Field -> (Row, Col) -> Int -> Map -> Map
update' f (r, c) e m
    | outOfRange = m
    | otherwise  = M.update (\a -> Just (min a (val + e))) (r, c) m
    where
        outOfRange = isNothing ref
        Just val   = ref
        ref = f `at` (r, c)


initMap' :: Map
initMap' = M.fromList [((r, c), 10^18) | r <- [0..size'], c <- [0..size']]


at :: Field -> (Row, Col) -> Maybe Int
at f (r, c) = do
                v <- f V.!? r
                v V.!? c


----------------------- supplimental -----------------------
splitComma :: String -> [String]
splitComma = splitRegex (mkRegex ",")
filename :: String
filename = "081.txt"
size' :: Int
size' = 79
