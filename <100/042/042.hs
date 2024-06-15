import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import Text.Regex ( mkRegex, splitRegex )
import Data.Char ( isAsciiUpper, ord )


main :: IO ()
main = do
  handle   <- openFile filename ReadMode
  contents <- hGetContents handle
  print . length . filter isTriangle . map (convert . extractCapitals) . splitComma $ contents
  hClose handle


-- make "SKY" to 55 = 19 + 11 + 25
convert :: String -> Int
convert [] = 0
convert (c:cs) = ord' + convert cs
    where ord' = ord c - ord 'A' + 1


isTriangle :: Integral int => int -> Bool
isTriangle = hasInverse triangleProd


-- returns if n can be produced by monotically increasing function f :: int -> int
hasInverse :: Integral int => (int -> int) -> int -> Bool
hasInverse f n = n == f lb
    where lb = lowerBoundInverse' 0 (10^9) f n


-- returns Sup{x | f x <= n, x in n}
lowerBoundInverse' :: Integral int => int -> int -> (int -> int) -> int -> int
lowerBoundInverse' smaller bigger f n
    | gap == 1   = smaller
    | f mid <= n = lowerBoundInverse' mid bigger f n
    | otherwise  = lowerBoundInverse' smaller mid f n
    where
        gap = bigger - smaller
        mid = (bigger + smaller) `div` 2


triangleProd :: Integral int => int -> int
triangleProd n = n*(n + 1) `div` 2


----------------------- supplemental -----------------------
filename :: String
filename   = "042.txt"


splitComma :: String -> [String]
splitComma = splitRegex (mkRegex ",")


extractCapitals :: String -> String
extractCapitals [] = []
extractCapitals (c:cs)
    | isCapital = c : extractCapitals cs
    | otherwise = extractCapitals cs
    where isCapital = isAsciiUpper c
