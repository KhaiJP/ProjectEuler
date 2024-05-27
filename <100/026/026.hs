import Data.List


main :: IO ()
main = print $ (1+) <$> maximumAt [ findPeriod n | n <- [1..upperLimit]]


findPeriod :: Integral t => t -> Int
findPeriod = findPeriod' 1 [] 
findPeriod' :: Integral t => t -> [t] -> t -> Int
findPeriod' n rs m
  | r == 0      = 0
  | r `elem` rs = length . dropWhile (/=r) $ reverse rs
  | otherwise   = findPeriod' n' rs' m
  where
    r   = n `mod` m
    n'  = r * 10
    rs' = r:rs


maximumAt :: Ord a => [a] -> Maybe Int
maximumAt list = elemIndex ( maximum list ) list


upperLimit :: Integer
upperLimit = 999
