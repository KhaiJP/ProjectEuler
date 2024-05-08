import Data.List


main :: IO ()
main = print $ head [read s :: Int| n <- [9876,9875..], let s = makeCycleCat n, isOneToNinePandigital s]


makeCycleCat :: Int -> String
makeCycleCat = makeCycleCat' "" 1


makeCycleCat' :: String -> Int -> Int -> String
makeCycleCat' base streak target
    | enoughLen = base
    | otherwise = makeCycleCat' next streak' target
    where
        enoughLen = length base >= 9
        next      = base ++ multiple
        multiple  = show $ target * streak
        streak'   = streak + 1


isOneToNinePandigital :: String -> Bool
isOneToNinePandigital s = s' == t
    where
        s' = sort s
        t  = "123456789"
