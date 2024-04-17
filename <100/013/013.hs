import System.IO


main = cat filepath

cat:: FilePath -> IO()
cat filename = do
    handle     <- openFile filename ReadMode
    contents   <- hGetContents handle
    let numStrings = lines contents
    let allSum     = sum $ map read' numStrings
    let sumString  = show allSum
    print $ take digits sumString 
    hClose handle


read'    = \s -> read s :: Integer
filepath = "013.txt"
digits   = 10
