import Math.NumberTheory.ArithmeticFunctions
import Data.List


main = print $ maybeAdd2 . minimumAt $ totientRates


totientRates = map totientRate [2..upperLimit]

totientRate :: Int -> Double
totientRate n
    | isOK      = nF / phi
    | otherwise = fromIntegral upperLimit
    where
        phi' = totient n
        phi  = fromIntegral phi' 
        nF   = fromIntegral n
        isOK = (s == t)
        s    = sort . show $ n
        t    = sort . show $ phi'

minimumAt :: Ord a => [a] -> Maybe Int
minimumAt list = elemIndex ( minimum list ) $ list

maybeAdd2 :: Maybe Int -> Maybe Int
maybeAdd2 mVal = case mVal of
    Nothing  -> Nothing
    Just val -> Just (val+2)


upperLimit = 10^7-1
