main :: IO ()
main = print $ sum [n | n <- [1..999], isMultOf3 n || isMultOf5 n]


isMultOf3 :: Int -> Bool
isMultOf3 = isMultOfM 3


isMultOf5 :: Int -> Bool
isMultOf5 = isMultOfM 5


isMultOfM :: Int -> Int -> Bool
isMultOfM m n = n `mod` m == 0
