main :: IO ()
main = print . snd . head . filter (isOK . fst) $ zip fibonacci [1..]


fibonacci :: [Integer]
fibonacci = [1, 1] ++ zipWith (+) fibonacci (tail fibonacci)


isOK :: Integer -> Bool
isOK x = numDigits x >= targetDigits


numDigits :: (Integral int, Show int) => int -> Int
numDigits = length . show


targetDigits :: Int
targetDigits = 1000
