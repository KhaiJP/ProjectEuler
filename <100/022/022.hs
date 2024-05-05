import System.IO
import Text.Regex
import Data.Char
import Data.List


main = do
  handle   <- openFile filename ReadMode
  contents <- hGetContents handle
  let sortedNames = sort . splitComma $ contents
  let scores      = map convert sortedNames
  let converted   = zipWith (*) scores [1..]
  print $ sum converted


filename   = "022.txt"
splitComma = splitRegex (mkRegex ",")


-- "ABC" = 1 + 2 + 3, "aBC\"\n" = 0 + 2 + 3 + 0 + 0
convert :: String -> Int
convert []     = 0
convert (c:cs) = score + convert cs
  where
    score = a - a' + 1
    a     = if c `elem` ['A'..'Z'] then ord c else ord 'A' - 1
    a'    = ord 'A'

