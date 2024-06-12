import GHC.Base ( modInt )
import qualified Data.Map.Strict as M
type Memo = M.Map Int Int


main :: IO ()
main = print $ partition (M.singleton 0 1) 1


partition :: Memo -> Int -> Maybe Int
partition memo n
    | n == 10^8 = Nothing
    | part == 0 = Just n
    | otherwise = partition memo' (n+1)
    where
        part   = modInt1e6 . sum $ zipWith (*) parts coeffs
        parts  = [memo M.! (n-k) | k <- pents]
        pents  = takeWhile (<= n) [pentagonalProd k | k <- concat . map (\x -> [x, -x]) $ [1..]]
        coeffs = cycle [1, 1, -1, -1]
        memo'  = M.insert n part memo


pentagonalProd :: Int -> Int
pentagonalProd n = n * (3*n - 1) `div` 2


modInt1e6 :: Int -> Int
modInt1e6 = flip modInt (10^6)
