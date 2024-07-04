import qualified Data.Map.Strict as M ( Map, update, (!), (!?), fromList )
import Data.Maybe ( fromMaybe )
type Row      = M.Map Position Int
type Position = Int
type Width    = Int


main :: IO ()
main = print . sum . map (M.! maxWidth) $ finalRows


finalRows :: [Row]
finalRows = do
                w <- tiles
                let candidates = [(n, w) | n <- [1..maxWidth]]
                return $ foldl update' initRow candidates


initRow :: Row
initRow = M.fromList [(n, 0) | n <- [0..maxWidth]]


update' :: Row -> (Position, Width) -> Row
update' row (x, w) = M.update (\a -> Just $ a+s+l) x row
    where
        s = maybe 0 (+1) $ row M.!? (x-w)
        l = fromMaybe 0 $ row M.!? (x-1)


tiles :: [Width]
tiles = [2, 3, 4]


maxWidth :: Width
maxWidth = 50
