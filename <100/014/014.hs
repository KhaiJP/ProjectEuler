import qualified Data.Map.Strict as M
type Memo = M.Map Int Int


main :: IO ()
main = print . snd . maximum . map invertPair . M.toList $ resultMap


resultMap :: Memo
resultMap = foldl updateCollatz M.empty [1..upperLimit]


updateCollatz :: Memo -> Int -> Memo
updateCollatz memo n = updateCollatz' memo n n 1


updateCollatz' :: Memo -> Int -> Int -> Int -> Memo
updateCollatz' memo target current len
    | target == 1  = M.insert target len memo
    | haveVisitied = M.insert target (len+logged) memo
    | otherwise    = updateCollatz' memo target next' (len+1)
    where
        haveVisitied = M.member current memo
        logged       = memo M.! current
        next'        = if even current
                        then current `div` 2
                        else 3*current + 1


invertPair :: (a, a) -> (a, a)
invertPair (a, b) = (b, a)


upperLimit :: Int
upperLimit = 10^6-1
