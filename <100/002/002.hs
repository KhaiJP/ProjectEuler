main :: IO ()
main = print . sum . filter even . takeWhile (<upperLimit) $ fibSequence


fibSequence :: [Int]
fibSequence = [1,2] ++ zipWith (+) fibSequence (tail fibSequence)


----------------------- supplemental -----------------------
upperLimit :: Int
upperLimit = 4*10^6
