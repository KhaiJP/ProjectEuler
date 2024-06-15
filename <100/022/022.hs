import System.IO ( hGetContents, openFile, IOMode(ReadMode) )
import Text.Regex ( mkRegex, splitRegex )
import Data.Char ( ord )
import Data.List ( sort )


main :: IO ()
main = do
  handle   <- openFile filename ReadMode
  contents <- hGetContents handle
  let sortedNames = sort . splitComma $ contents
  let scores      = map convert sortedNames
  let converted   = zipWith (*) scores [1..]
  print $ sum converted


-- "ABC" = 1 + 2 + 3, "aBC\"\n" = 0 + 2 + 3 + 0 + 0
convert :: String -> Int
convert []     = 0
convert (c:cs) = score + convert cs
  where score = if c `elem` ['A'..'Z'] then ord c - ord 'A' + 1 else 0


----------------------- supplemental -----------------------
filename :: String
filename   = "022.txt"


splitComma :: String -> [String]
splitComma = splitRegex (mkRegex ",")
