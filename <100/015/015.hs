import qualified Data.Map.Strict as M
type XY = (Int, Int)
type Map = M.Map XY Int


main :: IO ()
main = print $ resultMap M.! (limit, limit)


resultMap :: Map
resultMap = foldl foldFunc initMap [(x, y) | x <- [0..limit], y <- [0..limit]]


foldFunc :: Map -> XY -> Map
foldFunc m (x, y) = m''
    where
        m'  = update' val (x+1, y) m
        m'' = update' val (x, y+1) m'
        val = m M.! (x, y)


update' :: Int -> XY -> Map -> Map
update' val (x, y) m
    | M.member (x,y) m     = M.update (\a -> Just (a+val)) (x,y) m
    | x<=limit && y<=limit = M.insert (x,y) val m
    | otherwise            = m


initMap :: Map
initMap = M.insert (0, 0) 1 M.empty


limit :: Int
limit = 20
