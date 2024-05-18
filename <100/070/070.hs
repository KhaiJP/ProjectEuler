import Math.NumberTheory.ArithmeticFunctions ( totient )
import Data.List ( elemIndex, sort )


main :: IO ()
main = print $ (+2) <$> minimumAt totientRates


totientRates :: [Double]
totientRates = map totientRate [2..upperLimit]


totientRate :: Int -> Double
totientRate n
    | isOK      = nF / phi
    | otherwise = fromIntegral upperLimit
    where
        phi' = totient n
        phi  = fromIntegral phi'
        nF   = fromIntegral n
        isOK = s == t
        s    = sort . show $ n
        t    = sort . show $ phi'


minimumAt :: Ord a => [a] -> Maybe Int
minimumAt list = elemIndex ( minimum list ) list


upperLimit :: Int
upperLimit = 10^7-1
