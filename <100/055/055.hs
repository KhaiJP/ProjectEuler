import Data.Maybe (isNothing)


main :: IO ()
main = print $ length . filter id $ [isLychrel n | n <- [1..upperLimit]]


isLychrel :: Integer -> Bool
isLychrel = isNothing . findPeriod 1


findPeriod :: Integer -> Integer -> Maybe Integer
findPeriod cnt n
    | cnt > maxItr    = Nothing
    | isPalindrome n' = Just cnt
    | otherwise       = findPeriod (cnt+1) n'
    where n' = reverseAdd n


reverseAdd :: Integer -> Integer
reverseAdd n = n + r
    where r = read . reverse . show $ n


isPalindrome :: Integer -> Bool
isPalindrome n = s == t
    where
        s = show n
        t = reverse s


upperLimit :: Integer
upperLimit = 10^4
maxItr :: Integer
maxItr = 50
