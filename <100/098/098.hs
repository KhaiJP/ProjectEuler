import Control.Monad ( (<=<) )
import Data.Maybe ( isJust )
import Data.Bifunctor ( second )
import System.IO ( hGetContents, openFile, IOMode(ReadMode) )
import Text.Regex ( mkRegex, splitRegex )
import Data.Char ( isAsciiUpper, ord )
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List ( sort )
type Map = M.Map String (S.Set String)


main :: IO ()
main = do
    handle   <- openFile filename ReadMode
    contents <- hGetContents handle
    -- naive solution. this algo takes roughly 1 minute
    print . maximum . map check . toContentsGrp $ contents


-- toContentGrp "\"CARE\",\"RACE\"" -> [ ("ACER", ["CARE", "RACE"]) ]
toContentsGrp :: String -> [(String, [String])]
toContentsGrp s = map (second S.toList) . M.toList . foldl update' M.empty $ formatText s


-- formatText "\"CARE\",\"RACE\"" -> ["CARE", "RACE"]
-- original text is comma separated and each word is enclosed by "~" such as "CARE"
formatText :: String -> [String]
formatText = map extractCapitals . splitComma


-- check' "ACER" ["CARE", "RACE"] -> Just 9216
-- (sorted, [word])-> sort word == sorted 
check :: (String, [String]) -> Maybe Int
check (_, [ ]) = Nothing
check (_, [x]) = Nothing
check (r,  xs) = maximum [max' r perm comb | comb <- combs, perm <- perms]
    where
        combs = combinations 2 xs
        perms = permutations' (length r) "0123456789"


-- max' "ACER" "2169" ["CARE", "RACE"] -> Just 9216
max' :: String -> String -> [String] -> Maybe Int
max' r perm strs = if isJust . sequenceA $ maybeInts
                    then maximum maybeInts 
                    else Nothing
    where
        -- make ["WORDS"] to [Just num or Nothing]. "WORD" become Just num iff converted num is squared
        maybeInts = map ((toMaybeSquared <=< toMI) . map (convertor M.!)) strs
        convertor = M.fromList $ zip r perm
        toMI s_ = if head s_ == '0' then Nothing else Just . read $ s_


----------------------- supplemental -----------------------
filename :: String
filename   = "098.txt"


splitComma :: String -> [String]
splitComma = splitRegex (mkRegex ",")


extractCapitals :: String -> String
extractCapitals [] = []
extractCapitals (c:cs)
    | isCapital = c : extractCapitals cs
    | otherwise = extractCapitals cs
    where isCapital = isAsciiUpper c


select :: [a] -> [(a, [a])]
select [x] = [(x, [])]
select (x:xs) = (x,xs) : [(y, x:ys) | (y, ys) <- select xs]


permutations' :: Int -> [a] -> [[a]]
permutations' 0 _  = [[]]
permutations' n xs = [y:zs | (y, ys) <- select xs, zs <- permutations' (n - 1) ys]


combinations :: Int -> [a] -> [[a]]
combinations n xs = comb n (length xs) xs
    where
        comb 0 _ _ = [[]]
        comb r n a@(x:xs)
            | n == r    = [a]
            | otherwise = map (x:) (comb (r - 1) (n - 1) xs) ++ comb r (n - 1) xs


update' :: Map -> String -> Map
update' m s
    | M.member s' m = M.update (Just . S.insert s) s' m
    | otherwise     = M.insert s' (S.singleton s) m
    where s' = sort s


sqrt' :: Int -> Int
sqrt' = binarySearch (^2) 0 (10^8)


binarySearch :: (Int -> Int) -> Int -> Int -> Int -> Int
binarySearch f smaller bigger target
    | gap == 1      = smaller
    | f m <= target = binarySearch f m bigger target
    | otherwise     = binarySearch f smaller m target
    where
        gap = bigger - smaller
        m   = (bigger + smaller) `div` 2


isSquared :: Int -> Bool
isSquared x = (==) x $ (^2) . sqrt' $ x


toMaybeSquared :: Int -> Maybe Int
toMaybeSquared x
    | isSquared x = Just x
    | otherwise   = Nothing
