import qualified Data.Map.Strict as M
import qualified Data.Set as S
type Map = M.Map Int Int


main :: IO ()
main = print . sum . toUniqPSNs $ logs


record :: Int -> Int -> [Int] -> Map -> Map
record p s xs m
    | k > maxK  = m
    | otherwise = foldl foldFunc m' $ takeWhile smallEnough [h..maxK]
    where
        m' = M.update (\a -> Just (min a p)) k m
        k  = length xs + d
        d  = p - s
        h  = if null xs
                then 2
                else head xs

        foldFunc m'' n = record (p*n) (s+n) (n:xs) m''
        smallEnough x  = p*x < 2*maxK


-- PSN: product-sum number
toUniqPSNs :: Map -> [Int]
toUniqPSNs = S.toList . S.fromList . map snd . M.toList


-- key: k, value: minimal PSN
logs :: Map
logs = record 1 0 [] initialMap


-- PSNs for all k <= maxK are initialized to be 2*maxK
initialMap :: Map
initialMap = foldl (\m a -> M.insert a (2*maxK) m) M.empty [2..maxK]


-- the upper limit of k
maxK :: Int
maxK = 12000
