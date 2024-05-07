import Data.List

main = print $ fmap (+1) . maximumAt $ [ length $ findPeriod n | n <- [1..upperLimit]]

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


upperLimit :: Integer = 999
