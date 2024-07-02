import qualified Data.Map.Strict as M ( Map, update, (!), (!?), fromList )
import Data.Maybe ( fromJust, fromMaybe )
type Row      = M.Map Position Int
type Position = Int
type Width    = Int


main :: IO ()
main = print $ finalRow M.! maxWidth +1 -- the final +1 corresponds to no-tile-there case.


finalRow :: Row
finalRow = foldl update' initRow [1..maxWidth]


initRow :: Row
initRow = M.fromList [(n, 0) | n <- [0..maxWidth]]


update' :: Row -> Position -> Row
update' row x = M.update (\a -> Just (a+s+l)) x row
    where
        s = sum $ map (\w -> fromMaybe 0 $ Just (+1) <*> row M.!? (x-w)) tiles
        l = fromMaybe 0 $ row M.!? (x-1)


tiles :: [Width]
tiles = [2, 3, 4]


maxWidth :: Width
maxWidth = 50
