import Data.Char (intToDigit, chr, ord)
import Numeric (showIntAtBase)

n `inBase` b = showIntAtBase b numberToLetter n ""

numberToLetter :: Int -> Char
numberToLetter n
    | n < 10 = intToDigit n
    | otherwise = chr (ord 'a' + n - 10)

main :: IO ()
main = do
    putStrLn $ 8 `inBase` 12
    putStrLn $ 10 `inBase` 12
    putStrLn $ 112 `inBase` 12
    putStrLn $ 47 `inBase` 18
    putStrLn $ 17 `inBase` 18
