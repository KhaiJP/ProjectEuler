import Numeric (showBin)


main :: IO ()
main = print $ sum [n | n <- [1..upperLimit], isBothPalindrome n]


isBothPalindrome :: Integer -> Bool
isBothPalindrome n = isP10 && isP2
    where
        isP10 = isPalindrome . show $ n
        isP2  = isPalindrome . showBin' $ n


isPalindrome :: Eq a => [a] -> Bool
isPalindrome s = reverse s == s


showBin' :: Integer -> String
showBin' = flip showBin ""


upperLimit :: Integer
upperLimit = 10^6
