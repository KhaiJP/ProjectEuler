import qualified Data.Set as S
import Data.List ( group, maximumBy )
import Data.Numbers.Primes ( isPrime, primeFactors )
import Data.Maybe ( isJust )
type Set = S.Set Int


main :: IO ()
main = print . head . S.toList . maximumBy (\s t -> compare (S.size s) (S.size t)) $ amicableChains


amicableChains :: [Set]
amicableChains = [(\(Just s) -> s) ac | n <- [1..upperLimit], let ac = amicableChain n, isJust ac]


-- amicableChain 12496 -> Set [12496, 14264, 14288, 14536, 15472]
amicableChain :: Int -> Maybe Set
amicableChain n = amicableChain' S.empty n n


amicableChain' :: Set -> Int -> Int -> Maybe Set
amicableChain' s r n
    | n' > upperLimit = Nothing
    | n' == r         = Just s'
    | S.member n s    = Nothing
    | otherwise       = amicableChain' s' r n'
    where
        n' = properSum n
        s' = S.insert n s


properSum :: Int -> Int
properSum n = divisorsSum n - n


divisorsSum :: Int -> Int
divisorsSum = product . mPrimeSum . primeFactors'


-- if given [[Int]] is [ [2, 2, 2], [3, 3] ], this function returns [15, 13]
mPrimeSum :: [[Int]] -> [Int]
mPrimeSum = map primeSum


-- [p, ... , p] with length n represents p^n. primeSum calculates \sum_{k=0}^n p^k
primeSum :: [Int] -> Int
primeSum [] = 0
primeSum xs =  (x^(l+1) - 1) `div` (x - 1)
    where l = length xs
          x = head xs


-- if given number is 72 = 2^3 * 3^2, this function returns [ [2, 2, 2], [3, 3] ]
primeFactors' :: Int -> [[Int]]
primeFactors' = group . primeFactors


upperLimit :: Int
upperLimit = 10^6
