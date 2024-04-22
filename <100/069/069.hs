import Math.NumberTheory.ArithmeticFunctions
import Data.List


main = print $ maybeAdd1 . maximumAt $ totientRates

maximumAt :: Ord a => [a] -> Maybe Int
maximumAt list = elemIndex ( maximum list ) $ list

totientRates = map totientRate [1..upperLimit]
totientRate :: Int -> Double
totientRate n = nF / phi
    where
        phi = fromIntegral . totient $ n
        nF  = fromIntegral n

maybeAdd1 :: Maybe Int -> Maybe Int
maybeAdd1 mVal = case mVal of
    Nothing  -> Nothing
    Just val -> Just (val+1)

upperLimit = 10^6
