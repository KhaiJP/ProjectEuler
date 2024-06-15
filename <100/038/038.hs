import Data.List ( sort )


main :: IO ()
main = print $ head [read s :: Int| n <- [9876,9875..], let s = makeProdCat n, isOneToNinePandigital s]


makeProdCat :: Int -> String
makeProdCat = makeProdCat' "" 1


makeProdCat' :: String -> Int -> Int -> String
makeProdCat' base streak target
    | enoughLen = base
    | otherwise = makeProdCat' next streak' target
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
