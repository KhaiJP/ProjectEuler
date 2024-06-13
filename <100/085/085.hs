import Data.List


main = do
    print . uncurry (*) . head . sortOn (\tp -> abs (target - rects tp)) $ patterns


patterns :: [(Int, Int)]
patterns = [(n, m) | n <- [1..200], m <- [1..200]]


rects :: (Int, Int) -> Int
rects (n, m) = tn * tm
    where
        tn = triangleProd n
        tm = triangleProd m


triangleProd :: Int -> Int
triangleProd n = n * (n+1) `div` 2


target :: Int
target = 2 * 10^6
