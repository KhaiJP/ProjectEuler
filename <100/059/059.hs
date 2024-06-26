import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import Text.Regex ( mkRegex, splitRegex, matchRegex )
import Data.Char ( chr, ord )
import Data.Bits ( xor )
import Data.Maybe ( isJust )


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let nums    = map read . splitComma $ contents
    let message = head . filter doesIncludeEuler . map ($ nums) $ decrypters
    let answer  = sum . map ord $ message
    putStrLn message
    print answer
    hClose handle


doesIncludeEuler :: String -> Bool
doesIncludeEuler = isJust . matchRegex (mkRegex "Euler")


decrypters :: [[Int] -> String]
decrypters = [map chr . decrypt key | key <- keyCandidates]


decrypt :: [Int] -> [Int] -> [Int]
decrypt key = zipWith xor (cycle key)


keyCandidates :: [[Int]]
keyCandidates = [map ord [c1, c2, c3] | c1 <- ['a'..'z'], c2 <- ['a'..'z'], c3 <- ['a'..'z']]



----------------------- supplimental -----------------------
splitComma :: String -> [String]
splitComma = splitRegex (mkRegex ",")


filename :: String
filename = "059.txt"
