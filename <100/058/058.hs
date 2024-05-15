import Data.Numbers.Primes ( isPrime )


main :: IO ()
main = print $ solve 0 1


solve :: Int -> Int -> Maybe Int
solve cnt n
    | n > safeGuard    = Nothing
    | 10*cnt' <= 4*n+1 = Just (2*n + 1)
    | otherwise        = solve cnt' (n+1)
    where
        cnt' = cnt + ( length . filter isPrime $ [an, bn, cn, dn] )
        an   = (2*n + 1)^2
        bn   = an - 2*n
        cn   = bn - 2*n
        dn   = cn - 2*n
        -- see <100/028/028.md for the meanings of an, bn, cn, dn.


safeGuard :: Int
safeGuard = 10^6
