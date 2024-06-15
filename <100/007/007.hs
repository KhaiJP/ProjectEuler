import Data.Numbers.Primes ( primes )


main :: IO ()
main = print $ primes !! target


----------------------- supplemental -----------------------
target :: Int
target = 10000
