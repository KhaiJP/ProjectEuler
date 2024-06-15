import qualified Data.Set as S


main :: IO ()
main = print $ count 2 2 S.empty


count :: Integer -> Integer -> S.Set Integer -> Int
count a b s
    | a == 101  = S.size s
    | b == 100  = count (a+1) 2 t
    | otherwise = count a (b+1) t
    where t = S.insert (a^b) s
