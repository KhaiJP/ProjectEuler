-- see 094.md for the strategy of this problem.
import Data.List ( concat )


main :: IO ()
main = print . sum $ perimeters


perimeters :: [Integer]
perimeters = takeWhile (<=upperLimit) $ concat perimeters'

perimeters' :: [[Integer]]
perimeters' = map (\(x, _) -> makePerimeters x) pellSolutions


pellSolutions :: [(Integer, Integer)]
pellSolutions = scanl update initial [answerPell3 | n <- [1..]]


makePerimeters :: Integer -> [Integer]
makePerimeters x = neg ++ pos
    where
        neg = [k6n - 2 | k6n `mod` 6 == 0]
        pos = [k6p + 2 | k6p `mod` 6 == 0]
        k6n = 2*x + 4
        k6p = 2*x - 4


-- minimum solution (2, 1) yields a triangle with edges 1 1 0, actually not a triangle
initial :: (Integer, Integer)
initial = update answerPell3 answerPell3


-- minimum solution of Pell's equation x^2 - 3*y^2 = 1. see PE065 if necessary.
answerPell3 :: (Integer, Integer)
answerPell3 = (2, 1)


-- xn + sqrt{D}yn = (x1 + sqrt{D}y1)^n is also a solution of Pell's equation x^2-Dy^2 = 1.
update :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
update (x1, y1) (x2, y2) = (x', y')
    where
        x' = x1*x2 + 3*y1*y2
        y' = x1*y2 + x2*y1


upperLimit :: Integer
upperLimit = 10^9
