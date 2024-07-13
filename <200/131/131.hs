import Data.Numbers.Primes ( isPrime )


main :: IO ()
main = print . length . filter isPrime . takeWhile (<10^6) $ [(n+1)^3 - n^3 | n <- [1..]]
