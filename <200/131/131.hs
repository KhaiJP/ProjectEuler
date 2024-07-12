import Data.Numbers.Primes ( isPrime )


main :: IO ()
main  = print . length $ do
        a <- [1..600]
        let l = a^3
        b <- filter (\b -> let u = b^3 in let gap = u - l in
                        gap < 10^6 &&
                        l `mod` gap /= 0 &&
                        isPrime gap
                    ) [(a+1)..601]
        return 1
