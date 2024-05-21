import System.IO ( IOMode(ReadMode), hGetContents, openFile )
import Text.Regex ( mkRegex, splitRegex )
import Data.List ( maximumBy )


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let strings = splitRegex (mkRegex "\n") contents
    let pairs   = map splitPair strings
    let triples = zipWith (\z (x, y) -> (z, x, y)) [1..] pairs
    let (answer, _, _) = maximumBy (\tp1 tp2 -> compare (myPower tp1) (myPower tp2)) triples
    print answer


myPower :: (Integer, Integer, Integer) -> Integer
myPower (_, x, y) = x^y


splitPair :: String -> (Integer, Integer)
splitPair s = (x, y)
    where [x,y] = fmap read . splitRegex (mkRegex ",") $ s


filename :: String
filename = "099.txt"
