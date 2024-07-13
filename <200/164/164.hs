import qualified Data.Map.Strict as M ( Map, map, toList, fromList, update, (!))
import Data.Char ( digitToInt )
import Data.List ( elem )
type EachTable = M.Map Int Int
type DPTable = M.Map String EachTable


main :: IO ()
main = print . sum . map snd . M.toList . M.map (M.! 20) $ lastDPTable


lastDPTable :: DPTable
lastDPTable = foldl dpUpdate' initDPTable eachCase


dpUpdate' :: DPTable -> (String, Int) -> DPTable
dpUpdate' memo (key, n) = memo'
    where
        nexts = ['0'..'9']
        memo' = foldl dpUpdate'' memo nexts
        y = memo M.! key M.! n
        dpUpdate'' :: DPTable -> Char -> DPTable
        dpUpdate'' m c = M.update (Just . M.update (\x -> Just (x + y)) (n+1)) k' m
            where
                k' = reverse . take 3 . (c:) . reverse $ key
                isValid :: String -> Bool
                isValid = flip elem validKeys


eachCase :: [(String, Int)]
eachCase = [(k, n) | n <- [3..19], k <- validKeys]


validKeys :: [String]
validKeys = map fst . M.toList $ initDPTable


initDPTable :: DPTable
initDPTable = M.fromList [(threeDigitShow n, subInitTable n) | n <- [0..999], digitSum n <= 9]
    where
        digitSum       = sum . map digitToInt . show
        subInitTable n = M.fromList $ (3, x) : [(n, 0) | n <- [4..20]]
            where x = if n < 100 then 0 else 1


threeDigitShow :: Int -> String
threeDigitShow n
    | 999 < n   = "-1"
    | otherwise = reverse . take 3 . reverse . ("00" ++) . show $ n
