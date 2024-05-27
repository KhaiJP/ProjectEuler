import Data.List


main :: IO ()
main = print $ (1+) <$> maximumAt [ length $ findCycle n | n <- [1..upperLimit]]


findCycle :: Integral t => t -> [t]
findCycle = findCycle' 1 [] 
findCycle' :: Integral t => t -> [t] -> t -> [t]
findCycle' n rs m
  | r == 0      = []
  | r `elem` rs = dropWhile (/=r) $ reverse rs
  | otherwise   = findCycle' n' rs' m
  where
    r   = n `mod` m
    n'  = r * 10
    rs' = r:rs


maximumAt :: Ord a => [a] -> Maybe Int
maximumAt list = elemIndex ( maximum list ) list


upperLimit :: Integer
upperLimit = 999
