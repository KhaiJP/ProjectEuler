import Data.Numbers.Primes


main :: IO ()
main = print . head . filter achievedTarged $ [2..]


primePartition :: Int -> Int -> Int
primePartition 0 _ = 1
primePartition _ 0 = 0
primePartition n k = memo !! n !! (k-1)  + if isPrime k && k <= n
                                            then memo !! (n-k) !! k
                                            else 0

memo :: [[Int]]
memo = [ [primePartition n k | k <- [0..] ]  | n <- [0..] ]


achievedTarged :: Int -> Bool
achievedTarged n = primePartition n n > target


target :: Int
target = 5000
