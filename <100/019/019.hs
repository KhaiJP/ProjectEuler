main :: IO ()
main = print $ sum [1 | m <- [1..12], y <- [1901..2000], zeller 1 m y == 1]


zeller :: Int -> Int -> Int -> Int
zeller dd mm yy = h
    where
        h  = mod k 7
        k  = dd + div m_ 10 + y_ + div y_ 4 + g
        m_ = 26 * (mm'+1)
        y_ = mod yy' 100
        g  = (-2)*c + div c 4
        c  = div yy' 100
        mm'
          | mm <= 2   = mm + 12
          | otherwise = mm
        yy'
          | mm <= 2   = yy - 1
          | otherwise = yy
