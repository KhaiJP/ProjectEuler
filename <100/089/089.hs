import qualified Data.Map.Strict as M ( fromList, (!), Map )
import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import Text.Regex ( mkRegex, splitRegex )
import Data.Char ( digitToInt )
import Data.Bifunctor ( second )


main :: IO ()
main = do
  handle   <- openFile filename ReadMode
  contents <- hGetContents handle
  let originals  = splitLn contents
  let numChars1  = sum . map length $ originals
  let goodRomans = map ( numToRoman . readRoman) originals
  let numChars2  = sum . map length $ goodRomans
  let answer     = numChars1 - numChars2 
  print answer
  hClose handle


readRoman :: String -> Int
readRoman []  = 0
readRoman [c] = referenceToNum M.! c
readRoman (c1:c2:cs)
    | [c1,c2] == "IV" = 4 + readRoman cs
    | [c1,c2] == "IX" = 9 + readRoman cs
    | [c1,c2] == "XD" = 40 + readRoman cs
    | [c1,c2] == "XC" = 90 + readRoman cs
    | [c1,c2] == "CD" = 400 + readRoman cs
    | [c1,c2] == "CM" = 900 + readRoman cs
    | otherwise       = (referenceToNum M.! c1) + readRoman (c2:cs) 


-- numToRoman :: Int -> [String]
numToRoman :: Int -> String
numToRoman = concatMap conv' . devDigits


conv' :: (Int, Int) -> String
conv' (count, order)
    | order == 1000 = replicate count 'M'
    | count < 4     = replicate count chr'
    | count < 6     = replicate delta chr' ++ [chr'']
    | count < 9     = chr'' : replicate rest chr'
    | otherwise     = [chr', chr''']
    where
        chr'    = referenceToRoman M.! order
        chr''   = referenceToRoman M.! order'
        chr'''  = referenceToRoman M.! order''
        order'  =  5 * order
        order'' = 10 * order
        delta   = 5 - count
        rest    = count - 5


devDigits :: Int -> [(Int, Int)]
devDigits = map (second (10^)) . headOrd . show


headOrd :: String -> [(Int, Int)]
headOrd [] = []
headOrd (c:cs) = (digitToInt c, length cs) : headOrd cs


referenceToRoman :: M.Map Int Char
referenceToRoman = M.fromList [(1, 'I'), (5, 'V'), (10, 'X'), (50, 'L'), (100, 'C'), (500, 'D'), (1000, 'M')]


referenceToNum :: M.Map Char Int
referenceToNum = M.fromList [('I', 1), ('V', 5), ('X', 10), ('L', 50), ('C', 100), ('D', 500), ('M', 1000)]



----------------------- supplemental -----------------------
splitLn :: String -> [String]
splitLn = splitRegex (mkRegex "\n")


filename :: String
filename = "089.txt"
