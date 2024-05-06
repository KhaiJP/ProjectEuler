import System.IO
import Data.Char


main = do
  handle   <- openFile filename ReadMode
  contents <- hGetContents handle
  let digitsString = extractDigits contents
  print $ solve digitsString


solve = solve' 0
solve' :: Int -> String -> Int
solve' n [] = n
solve' n s  = solve' m cs
  where
    m  = max n e
    e  = evalSeq s
    cs = tail s


-- trim \n char. "0b123\nx456\ncd789" -> "0123456789"
extractDigits :: String -> String
extractDigits [] = []
extractDigits (c:cs)
  | isDigit c = c : extractDigits cs
  | otherwise = extractDigits cs


-- evaluate the product of the string that consists of digits
evalSeq :: String -> Int
evalSeq s
  | length s < target = 0
  | otherwise         = product . map digitToInt $ take target s


filename = "008.txt"
target   = 13

