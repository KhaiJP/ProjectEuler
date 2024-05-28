import Data.Numbers.Primes ( isPrime, primes )


main :: IO ()
main = print . minimum . map sum $ candidates


candidates :: [[Int]]
candidates = do
    let s0 = []

    let candidates1 = takeWhile (<upperLimit) primes
    p1 <- candidates1
    let s1 = p1:s0

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
        pq = read $ shows p $ show q
        qp = read $ shows q $ show p


upperLimit :: Int
upperLimit = 10^4
