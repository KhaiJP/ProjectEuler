import System.IO ( hClose, hGetContents, openFile, IOMode(ReadMode) )


main :: IO ()
main = cat filepath

cat:: FilePath -> IO()
cat filename = do
    handle     <- openFile filename ReadMode
    contents   <- hGetContents handle
    putStrLn . take numDigits . show . sum . map readInteger . lines $ contents 
    hClose handle


----------------------- supplemental -----------------------
filepath :: String
filepath = "013.txt"


readInteger :: String -> Integer
readInteger = read


numDigits :: Int
numDigits   = 10
