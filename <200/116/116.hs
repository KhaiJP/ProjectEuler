import qualified Data.Map.Strict as M ( Map, update, (!), fromList )
type Row      = M.Map Position Int
type Position = Int
type Width    = Int


main :: IO ()
main = print . sum . map (M.! maxWidth) $ finalRows


finalRows :: [Row]
finalRows = map (foldl update' initRow . makeCandidates) tiles


initRow :: Row
initRow = M.fromList [(n, 0) | n <- [0..maxWidth]]


update' :: Row -> (Position, Width) -> Row
update' row (x, w) = row'
    where
        row' = M.update (\a -> Just (a+p+q)) x row
        p    = if x - w >= 0
                    then row M.! (x-w) + 1
                    else 0
        q    = if x - 1 >= 0
                    then row M.! (x-1)
                    else 0


makeCandidates :: Width -> [(Position, Width)]
makeCandidates w = [(n, w) | n <- [1..maxWidth]]


tiles :: [Width]
tiles = [2, 3, 4]


maxWidth :: Width
maxWidth = 50
