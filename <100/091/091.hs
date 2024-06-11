import Data.List ( sort )
import Data.List.Unique ( uniq )
type Vect = (Int, Int)

main :: IO ()
main = print . length . filter (isRightTriangle . toThreeVect) . uniq . sort $ triangles


triangles :: [(Vect, Vect)]
triangles = do
            x1 <- [0..size']
            x2 <- [0..size']
            y1 <- [0..size']
            y2 <- [0..y1]
            let v1 = min (x1, y1) (x2, y2)
            let v2 = max (x1, y1) (x2, y2)
            return (v1, v2)


isRightTriangle :: (Vect, Vect, Vect) -> Bool
isRightTriangle triangle = isTriangle && isRight
    where
        l2s = sort . map sqrLength . castToList $ triangle
        isTriangle = head l2s /= 0
        isRight    = (==) (sum l2s) $ (*) 2 (last l2s)


sqrLength :: Vect -> Int
sqrLength v = v `dotVect` v


castToList :: (Vect, Vect, Vect) -> [Vect]
castToList (v1, v2, v3) = [v1, v2, v3]


toThreeVect :: (Vect, Vect) -> (Vect, Vect, Vect)
toThreeVect (v1, v2) = (v1, v2, v3)
    where v3 = v2 `subtVect` v1


subtVect :: Vect -> Vect -> Vect
subtVect (x1, y1) (x2, y2) = (x1-x2, y1-y2)


dotVect :: Vect -> Vect -> Int
dotVect (x1, y1) (x2, y2) = x1*x2 + y1*y2


size' :: Int
size' = 50
