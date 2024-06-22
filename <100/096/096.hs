import Data.Map.Strict as M ( (!?), notMember, toList, fromList, insert, Map )
import Data.Set as S ( delete, fromList, notMember, null, toList, Set )
import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import Text.Regex ( mkRegex, splitRegex )
import Data.Char ( digitToInt )
type Row = Int
type Col = Int
type Grid = Int -- id number of 3*3 box; 0 for upper-left and 8 for lower-right
type Coord = (Row, Col)
type IntSudoku = [[Int]]
type Sudoku = M.Map Coord Int
type Logger = S.Set Coord -- storing coordinates that are still empty
type Pair = (Sudoku, Logger)

{--
a : (Row, Col, Grid) = (0, 0, 0)
b : (Row, Col, Grid) = (1, 4, 1)
c : (Row, Col, Grid) = (6, 5, 5)
for Sudoku below.
a = = | = = = | = = =
= = = | = b = | = = =
= = = | = = = | = = =
---------------------
= = = | = = = | = = =
= = = | = = = | = = =
= = = | = = = | c = =
---------------------
a = = | = = = | = = =
= = = | = = = | = = =
= = = | = = = | = = =
---------------------
--}


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let sudokuStrings   :: [[String]]     = map (init . splitLn) . tail $ splitGrid contents
    let sudokuInts      :: [IntSudoku]    = map (map (map digitToInt)) sudokuStrings
    let sudokuSolutions :: [Maybe Sudoku] = map (solveSudoku . toSudokuForm) sudokuInts
    let threeDigits     :: [Maybe Int]    = map (extractUpperLeft3 <$>) sudokuSolutions
    let answer          :: Maybe Int      = sum <$> sequenceA threeDigits
    print answer
    hClose handle


-- extract 3-digit number from sudoku
extractUpperLeft3 :: Sudoku -> Int
extractUpperLeft3 sudoku
    | notSolvedYet = 0
    | otherwise    = read . concatMap (show . snd) $ [a, b, c]
    where
        notSolvedYet = length sudokuL < 3
        sudokuL      = M.toList sudoku
        (a:b:c:xs)   = sudokuL


-- solve given sudoku puzzle; if there are multiple solutions then gives 1 of them, and if no solution there then gives Nothing
solveSudoku :: Sudoku -> Maybe Sudoku
solveSudoku sudoku = fst <$> safeHead solutions
    where
        safeHead []     = Nothing
        safeHead (x:xs) = Just x
        solutions = solveSudoku' (sudoku, makeInitLogger sudoku)


-- gives the coordinates that are empty
makeInitLogger :: Sudoku -> Logger
makeInitLogger sudoku = S.fromList . filter (`M.notMember` sudoku) $ [(r, c) | r <- [0..8], c <- [0..8]]


-- solve by dfs represented by monadic chain.
solveSudoku' :: (Sudoku, Logger) -> [(Sudoku, Logger)]
solveSudoku' (sudoku, logger)
    | S.null logger = [(sudoku, logger)]
    | otherwise     = sudokus >>= solveSudoku'
    where
        sudokus = S.toList . S.fromList $
                        [(M.insert coord val sudoku, S.delete coord logger) |
                           let coord = head . S.toList $ logger,
                           val <- [1 .. 9],
                           isTrialAcceptable sudoku val coord]


-- check if the value 'val' at 'coord' is acceptable so far for Sudoku state 'sudoku'
isTrialAcceptable :: Sudoku -> Int -> Coord -> Bool
isTrialAcceptable sudoku val coord = all (isTrialAcceptable' sudoku val) [rows, cols, grid]
    where
        rows = getSameRowCoords  coord
        cols = getSameColCoords  coord
        grid = getSameGridCoords coord


-- check if those 'coords' in sudoku do not contain 'val'; if contains then a contradiction occurs -> False
isTrialAcceptable' :: Sudoku -> Int -> [Coord] -> Bool
isTrialAcceptable' sudoku val coords = S.notMember (Just val) existingValues
    where existingValues = S.fromList $ map (sudoku M.!?) coords


-- get the grid number of the given coord; grid number is 0 for upper-left, 2 for upper-right, 6 for lower-left, and 8 for lower-right
getGridNum :: Coord -> Grid
getGridNum (x, y) = 3*r + c
    where
        r = x `div` 3
        c = y `div` 3


-- get coords that are in the same Grid as given coord; if coord = (4, 7) -> [(3,6)~(3,8), (4,6), (4,8), (5,6)~(5,8)]
getSameGridCoords :: Coord -> [Coord]
getSameGridCoords coord = [(r, c) | r <- [lr..ur], c <- [lc..uc]]
    where
        g  = getGridNum coord
        lr = 3 * (g `div` 3)
        ur = lr + 2
        lc = 3 * (g `mod` 3)
        uc = lc + 2


-- get coords that are in the same Row as given coord; if coord = (4, 7) -> [(4,1)~(4,6), (4,8)]
getSameRowCoords :: Coord -> [Coord]
getSameRowCoords (r, c) = [(r, c') | c' <- [0..8], c' /= c]


-- get coords that are in the same Row as given coord; if coord = (4, 7) -> [(1,7)~(3,7), (5,7)~(8,8)]
getSameColCoords :: Coord -> [Coord]
getSameColCoords (r, c) = [(r', c) | r' <- [0..8], r' /= r]


----------------------- supplemental -----------------------
toSudokuForm :: IntSudoku -> Sudoku
toSudokuForm xxs = M.fromList . filter (\(_, a) -> a /= 0) $ [((r, c), xxs !! r !! c) | r <- [0..8], c <- [0..8]]


testSudoku :: IntSudoku
testSudoku = [[0, 0, 3,   0, 2, 0,   6, 0, 0],
              [9, 0, 0,   3, 0, 5,   0, 0, 1],
              [0, 0, 1,   8, 0, 6,   4, 0, 0],

              [0, 0, 8,   1, 0, 2,   9, 0, 0],
              [7, 0, 0,   0, 0, 0,   0, 0, 8],
              [0, 0, 6,   7, 0, 8,   2, 0, 0],

              [0, 0, 2,   6, 0, 9,   5, 0, 0],
              [8, 0, 0,   2, 0, 3,   0, 0, 9],
              [0, 0, 5,   0, 1, 0,   3, 0, 0]]


splitGrid :: String -> [String]
splitGrid = splitRegex (mkRegex "Grid [0-9][0-9]\n")


splitLn :: String -> [String]
splitLn = splitRegex (mkRegex "\n")


filename :: String
filename = "096.txt"
