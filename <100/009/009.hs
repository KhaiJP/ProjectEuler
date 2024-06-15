main :: IO ()
main = print . head $ rightTriangles


rightTriangles :: [Int]
rightTriangles = [a * b * (perimeter - (a+b)) | b <- [1..perimeter], a <- [1..b], isRightTriangle a b]


isRightTriangle :: Int -> Int -> Bool
isRightTriangle a b = a*a + b*b == c*c &&  b < c
    where c = perimeter - (a+b)


perimeter :: Int
perimeter = 1000
