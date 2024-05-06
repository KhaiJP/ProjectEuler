import Data.List

main = print $ maybeAdd1 . maximumAt $ [ length $ findPeriod n | n <- [1..upperLimit]]

findPeriod :: Integral t => t -> [t]
findPeriod = findPeriod' 1 [] 
findPeriod' :: Integral t => t -> [t] -> t -> [t]
findPeriod' n rs m
  | r == 0      = []
  | r `elem` rs = dropWhile (/=r) $ reverse rs
  | otherwise   = findPeriod' n' rs' m
  where
    r   = n `mod` m
    n'  = r * 10
    rs' = r:rs


maximumAt :: Ord a => [a] -> Maybe Int
maximumAt list = elemIndex ( maximum list ) list

maybeAdd1 :: Num a => Maybe a -> Maybe a
maybeAdd1 Nothing = Nothing
maybeAdd1 (Just val) = Just (val+1)

upperLimit :: Integer = 999
