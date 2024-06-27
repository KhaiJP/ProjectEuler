import Data.Ratio ( (%), denominator )
import Data.List ( elem, notElem )
import Data.Bifunctor ( bimap )


main :: IO ()
main = print . denominator . product . map (uncurry (%)) . take 4 . filter isDigitCancelling $ candidates


candidates :: [(Int, Int)]
candidates = [(n, d) | d <- [13..], n <- [11..(d-1)]]


isDigitCancelling :: (Int, Int) -> Bool
isDigitCancelling pair
    | both10Mult = False
    | otherwise  = pair /= pair' && uncurry (%) pair == uncurry (%) pair'
    where
        both10Mult = (n`mod`10 == 0) && (d`mod`10 == 0)
        pair'      = digitReduction pair
        (n, d)     = pair


digitReduction :: (Int, Int) -> (Int, Int)
digitReduction pair = pair'
    where
        pair' = if biand isValid isValid pairStr'
                    then bimap read read pairStr'
                    else (1, 1) 
        pairStr'  = bimap (filter notCommon) (filter notCommon) pairStr
        pairStr   = bimap show show pair
        notCommon =  (`notElem` both)
        both      = [c | c <- ['0'..'9'], biand (c `elem`) (c `elem`) pairStr]


biand :: (a -> Bool) -> (b -> Bool) -> (a, b) -> Bool
biand f g (a, b) = f a && g b


isValid :: String -> Bool
isValid []     = False
isValid (c:cs) = c /= '0'
