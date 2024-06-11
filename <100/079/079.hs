import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List
type DFA = M.Map Char (S.Set Char)


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let conditions = S.toList . S.fromList . lines $ contents
    let dfa        = foldl makeDFA M.empty conditions
    let candidates = permutations . S.toList . S.fromList . concat $ conditions
    putStrLn . head . filter (doMatchDFA dfa) $ candidates
    hClose handle


makeDFA :: DFA -> String -> DFA
makeDFA dfa [] = dfa
makeDFA dfa (c:cs) = makeDFA dfa' cs
    where
        dfa' = foldl update' dfa cs
        update' :: DFA -> Char -> DFA
        update' dfa_ c_ = if M.member c_ dfa_
                            then M.update (Just . S.insert c) c_ dfa_
                            else M.insert c_ (S.singleton c) dfa_


doMatchDFA :: DFA -> String -> Bool
doMatchDFA dfa s = doMatchDFA' dfa $ reverse s


doMatchDFA' :: DFA -> String -> Bool
doMatchDFA' _ []    = True
doMatchDFA' dfa [c] = True
doMatchDFA' dfa (c1:c2:cs)
    | M.notMember c1 dfa = False
    | S.notMember c2 s   = False
    | otherwise          = doMatchDFA' dfa (c2:cs)
    where s = dfa M.! c1


filename :: String
filename = "079.txt"
