import Data.Numbers.Primes

main :: IO ()
main = print $ snd . maximum $ [(k - j, pk - pj) |
                                  k <- [1 .. (len - 1)],
                                  let pk = ps !! k,
                                  j <- [1 .. k],
                                  let pj = ps !! j,
                                  isPrime (pk - pj)]


len :: Int
len = length ps
ps :: [Int]
ps = takeWhile (< upperLimit) . scanl1 (+) $ primes
upperLimit :: Int
upperLimit = 10^6
