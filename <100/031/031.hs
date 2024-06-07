import qualified Data.Map.Strict as M
type Map = M.Map Int Int


main :: IO ()
main = print $ resultMap M.! 200


resultMap :: Map
resultMap = foldl update' initMap patterns


update' :: Map -> (Int, Int) -> Map
update' m (coin, pos) = m'
    where
        m'   = M.update (\now -> Just (now+now')) (pos+coin) m 
        now' = m M.! pos


patterns :: [(Int, Int)]
patterns = do
            coin <- coins
            pos  <- takeWhile (<= 200-coin) [0..199]
            return (coin, pos)


coins :: [Int]
coins = [1, 2, 5, 10, 20, 50, 100, 200]


initMap :: Map
initMap = M.insert 0 1 $ M.fromList [(n, 0) | n <- [0..200]]
