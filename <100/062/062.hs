import qualified Data.Map.Strict as M
import Data.List ( sort )
import Data.Maybe ( isJust, fromMaybe )
type Map = M.Map String Int


main :: IO ()
main = print $ safeMinimum goodCubes


-- cubes; [n^3 | n <- [1..upperLimit]] with sort . show $ n^3 appear 5 or more times. 
goodCubes :: [Int]
goodCubes = [fromMaybe upperBound val | key <- goodKeys, let val = M.lookup key mMin, isJust val]


-- keys that counted 5 or more times
goodKeys :: [String]
goodKeys = map fst . filter (\tp -> snd tp >= 5) $ M.toList mCnt


-- mCnt: key is sort . show $ number^3. value is count that the corresponding key appears
-- mMin: key is sort . show $ number^3. value is minimum cube; number^3
mCnt :: Map
mMin :: Map
(mCnt, mMin) = findMap 1 M.empty M.empty


findMap :: Int -> Map -> Map -> (Map, Map)
findMap a mCnt mMin
    | a >= upperLimit = (mCnt, mMin)
    | otherwise       = findMap (a+1) mCnt' mMin'
    where
        mCnt' = updateCnt (\x -> Just (x+1)) key mCnt
        mMin' = updateMin (Just . min cubed) key mMin
        key   = sort . show $ cubed
        cubed = a^3


updateCnt :: (Int -> Maybe Int) -> String -> Map -> Map
updateCnt f key mp = if M.member key mp
                        then M.update f key mp
                        else M.insert key 1 mp


updateMin :: (Int -> Maybe Int) -> String -> Map -> Map
updateMin f key mp = if M.member key mp
                        then M.update f key mp
                        else M.insert key m mp
                        where
                            m = fromMaybe 1 (f upperBound)


-- almost same as function minimum. the only difference is that this function return Nothing for empty list
safeMinimum :: [Int] -> Maybe Int
safeMinimum [] = Nothing
safeMinimum [x] = Just x
safeMinimum (x:xs) = min (Just x) $ safeMinimum xs


upperBound :: Int
upperBound = maxBound
upperLimit :: Int
upperLimit = 10^4
