import qualified Data.Map.Strict as M
type Map = M.Map Int Int


main :: IO ()
main = print $ findMaxValueKey perimeterToCounts


perimeterToCounts :: Map
perimeterToCounts = countPerimeters M.empty 1 1


-- get Map whose keys are perimeter and keys are number of appearance of the key
countPerimeters :: Map -> Int -> Int -> Map
countPerimeters mp a b
    | a == 1000       = mp
    | b > a           = countPerimeters mp  a' 1
    | enjoysCondition = countPerimeters mp' a  b'
    | otherwise       = countPerimeters mp  a  b'
    where
        a'  = a + 1
        b'  = b + 1
        c   = mySqrt $ a^2 + b^2
        mp' = update' (\x -> Just (x+1)) perimeter mp
        perimeter = a + b + c
        enjoysCondition = perimeter <= 1000 && a^2+b^2 == c^2


-- if key is member of given Map, increment the corresponding value, else initialize by 1
update' :: (Ord a, Integral b) => (b -> Maybe b) -> a -> M.Map a b -> M.Map a b
update' f key mp = if M.member key mp
                    then M.update f key mp
                    else M.insert key 1 mp


-- find the key of Map whose value is the maximum among the values
findMaxValueKey :: Integral b => M.Map a b -> Maybe a
findMaxValueKey = findMaxValueKey' . M.toList 
findMaxValueKey' :: Integral b => [(a, b)] -> Maybe a
findMaxValueKey' []  = Nothing
findMaxValueKey' tps = findKey tps maxValue
    where maxValue = getMaxValue tps


-- find the key whose value is 'target'
findKey :: Integral b => [(a, b)] -> b -> Maybe a
findKey [] _            = Nothing
findKey (tp:tps) target = if snd tp == target
                                then Just (fst tp)
                                else findKey tps target


-- find the maximum value of all the values of the list
getMaxValue :: Integral b => [(a, b)] -> b
getMaxValue = getMaxValue' 0
getMaxValue' :: Integral b => b -> [(a, b)] -> b
getMaxValue' m []       = m
getMaxValue' m (tp:tps) = getMaxValue' m' tps
    where m' = max m $ snd tp


-- generic sqrt function closed in Int -> mySqrt 16 = 4, mySqrt 15 = 3
mySqrt :: Int -> Int
mySqrt = mySqrt' 0 (10^9)
mySqrt' :: Int -> Int -> Int -> Int
mySqrt' smaller bigger target
    | bigger - smaller == 1 = smaller
    | mid^2 <= target       = mySqrt' mid bigger target
    | otherwise             = mySqrt' smaller mid target
    where mid = (bigger+smaller) `div` 2
