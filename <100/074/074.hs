import qualified Data.Set as S
type Set = S.Set Integer

-- this naive algo is f***ing slow thou generates correct answer. memorization would helpfull to accelerate.
main :: IO ()
main = print . length $ filter (\s -> S.size s == 60) [findChainSet n | n <- [1..upperLimit]]


findChainSet :: Integer -> Set
findChainSet = findChainSet' S.empty


findChainSet' :: Set ->  Integer -> Set
findChainSet' s n
    | broken    = s
    | hasMet    = s
    | otherwise = findChainSet' s' next
    where
        broken = S.size s > 61
        hasMet =  S.member n s
        next   = digitFactorial n
        s'     = S.insert n s


digitFactorial :: Integer -> Integer
digitFactorial n
    | n < 10    = factorial n
    | otherwise = factorial m + digitFactorial n'
    where
        m  = n `mod` 10
        n' = n `div` 10


factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)


upperLimit :: Integer
upperLimit = 10^6 - 1
