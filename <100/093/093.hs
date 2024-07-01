import Data.Char ( isDigit, digitToInt )
import Data.List ( sort, permutations, maximumBy )
import Data.Maybe ( isJust )
import Control.Monad ( replicateM )
import qualified Data.Set as S ( fromList, toList )


main :: IO ()
main = putStrLn . fst . maximumBy comp $ [(c, l) | c <- candidates, let l = lengthMake24 c]


comp :: (String, Int) -> (String, Int) -> Ordering
comp a b = snd a `compare` snd b


-- when considering sufficiently big solution of Make 24, N*0 is not used and 0± == 1*. -> 0 is not necessarily considered
-- hence a starts from 1, not 0.
candidates :: [[Char]]
candidates = do
            a <- [1..6]
            b <- [(a+1)..7]
            c <- [(b+1)..8]
            d <- [(c+1)..9]
            return . shows a . shows b . shows c $ show d


lengthMake24 :: String -> Int
lengthMake24 numString = numMatch1ToN . uniqueSort $ validAnswers
    where
        numMatch1ToN = length . takeWhile id . zipWith (==) [1..]
        uniqueSort   = S.toList . S.fromList
        validAnswers = [a | ja <- solveMake24s numString, isJust ja, let Just a = ja, a > 0]


solveMake24s :: String -> [Maybe Int]
solveMake24s numString = map reversePolish problems
    where problems = concatMap (permutations . (numString ++)) opSets


reversePolish :: [Char] -> Maybe Int
reversePolish cs
    | badHead   = Nothing
    | badLast   = Nothing
    | otherwise = reversePolish' [] cs
    where
        badHead = not . isDigit . head $ cs
        badLast = isDigit . last $ cs


reversePolish' :: [Maybe Int] -> [Char] -> Maybe Int
reversePolish' []       [] = Nothing
reversePolish' [x]      [] = x
reversePolish' (x:y:xs) [] = Nothing
reversePolish' xs (c:cs)
    | isDigit c   = reversePolish' xs' cs
    | badResStack = Nothing
    | otherwise   = reversePolish' xs'' cs
    where
        badResStack = length xs < 2
        xs'  = (Just . digitToInt $ c ) : xs
        xs'' = makeNewResStack xs c


makeNewResStack :: [Maybe Int] -> Char -> [Maybe Int]
makeNewResStack (x_:y_:xs_) c_
    | c_ == '+' = ((+) <$> y_ <*> x_) : xs_
    | c_ == '-' = ((-) <$> y_ <*> x_) : xs_
    | c_ == '*' = ((*) <$> y_ <*> x_) : xs_
    | otherwise = maybeDiv y_     x_  : xs_
    where
        maybeDiv :: Maybe Int -> Maybe Int -> Maybe Int
        maybeDiv Nothing _  = Nothing
        maybeDiv _ Nothing  = Nothing
        maybeDiv _ (Just 0) = Nothing
        maybeDiv (Just x) (Just y)
            | x `mod` y == 0 = Just (x `div` y)
            | otherwise      = Nothing


opSets :: [[Char]]
opSets = replicateM 3 ['+', '-', '*', '/']
