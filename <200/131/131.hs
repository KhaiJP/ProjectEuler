import Data.Numbers.Primes ( isPrime )


main :: IO ()
main = print . length . filter isPrime . takeWhile (<10^6) $ [(l+1)^3 - l^3 | l <- [1..]]
