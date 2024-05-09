import Data.Numbers.Primes (isPrime)


main :: IO ()
main = print $ head [n | n <- [35,37..], not . isPrime $ n, not . enjoyGBConjecture $ n]


enjoyGBConjecture :: Integral int => int -> Bool
enjoyGBConjecture = enjoyGBConjecture' 1
enjoyGBConjecture' :: Integral int => int -> int -> Bool
enjoyGBConjecture' j n
    | candidate <= 0 = False
    | isprime        = True
    | otherwise      = enjoyGBConjecture' (j+1) n
    where
        candidate = n - 2 * (j^2)
        isprime   = isPrime candidate
 