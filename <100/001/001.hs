main :: IO ()
main = print $ sum [n | n <- [1..999], isMultipleOf3 n || isMultipleOf5 n]


isMultipleOf3 :: Int -> Bool
isMultipleOf3 = isMultipleOfM 3


isMultipleOf5 :: Int -> Bool
isMultipleOf5 = isMultipleOfM 5


isMultipleOfM :: Int -> Int -> Bool
isMultipleOfM m n = n `mod` m == 0
