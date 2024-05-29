import Data.Numbers.Primes


main :: IO ()
main = print . snd . maximum . filter (\(c, p) -> isPrime p) $ consecutives


consecutives :: [(Int, Int)]
consecutives = do
                k <- [1..(len-1)]
                let pk = ps!!k
                let j = myHead . filter (\j -> isPrime (pk - ps!!j)) $ [1..k]
                let pj = if j > 1 then ps!!j else -100000000
                return (k-j, pk-pj)


myHead :: [Int] -> Int
myHead [] = -1
myHead (x:xs) = x


len :: Int
len = length ps


ps :: [Int]
ps = takeWhile (< upperLimit) . scanl1 (+) $ primes


upperLimit :: Int
upperLimit = 10^6
