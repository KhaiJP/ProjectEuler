import Data.Numbers.Primes ( primes )


main :: IO ()
main = print $ sum $ takeWhile (<upperLimit) primes


upperLimit :: Int
upperLimit = 2000000
