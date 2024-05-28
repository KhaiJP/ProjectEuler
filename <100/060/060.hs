import Data.Numbers.Primes ( isPrime, primes )
import Data.List ( subsequences )


main :: IO ()
main = print . solve $ candidates


solve :: [[Int]] -> Int
solve = minimum . map sum . filter isGoodList


candidates :: [[Int]]
candidates = do
    p1 <- candidates1
    let s1 = [p1]
    let candidates2 = filter (allPrimes s1) $ dropWhile (<= p1) candidates1
    p2 <- candidates2
    let s2 = p2:s1
    let candidates3 = filter (allPrimes s2) $ dropWhile (<= p2) candidates2
    p3 <- candidates3
    let s3 = p3:s2
    let candidates4 = filter (allPrimes s3) $ dropWhile (<= p3) candidates3
    p4 <- candidates4
    let s4 = p4:s3
    let candidates5 = filter (allPrimes s4) $ dropWhile (<= p4) candidates4
    p5 <- candidates5
    let s5 = p5:s4
    return s5


allPrimes :: [Int] -> Int -> Bool
allPrimes [] _ = True
allPrimes (p:ps) q
    | not . isPrime $ pq = False
    | not . isPrime $ qp = False
    | otherwise = allPrimes ps q
    where
        pq = concat' p q
        qp = concat' q p


isGoodList :: [Int] -> Bool
isGoodList = all (\[p, q] -> isPrime (concat' p q) && isPrime (concat' q p)) . combinations 2


combinations :: Int -> [a] -> [[a]]
combinations k = filter ((== k) . length) . subsequences


concat' :: Int -> Int -> Int
concat' p q = read $ shows p $ show q


candidates1 :: [Int]
candidates1 = takeWhile (<upperLimit) primes


upperLimit :: Int
upperLimit = 10^4
