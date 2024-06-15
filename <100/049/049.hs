import Data.Numbers.Primes ( isPrime )
import Data.List.Unique ( uniq )
import Data.List ( sort )


main :: IO ()
main = putStrLn . last . take 2 $ [concatMap show seq | a <- [1001..9999], d <- [2,4..(10000-2*a)], let seq = [a, a+d, a+2*d], check seq]


check :: [Int] -> Bool
check seq = allPrime && allPerms
    where
        allPrime = all isPrime seq
        allPerms = (==) 1 length'
        length'  = length . uniq  . map (sort . show) $ seq
