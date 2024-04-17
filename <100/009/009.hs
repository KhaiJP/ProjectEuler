main = print $ head rightTriangles

perimeter = 1000
rightTriangles = [a * b * (perimeter - (a+b)) | b <- [1..perimeter], a <- [1..b], isRightTriangle a b]
isRightTriangle a b = a*a + b*b == c*c &&  b < c
    where c = perimeter - (a+b)