main :: IO ()
main = print $ sum powers `mod` 10^10


powers :: [Integer]
powers = zipWith (^) [1..1000] [1..1000]
