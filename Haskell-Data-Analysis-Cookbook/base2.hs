import Data.Char (ord, digitToInt, isDigit)
import Numeric (readInt)

main :: IO ()
main = do
    print $ "8" `base` 12
    print $ "a" `base` 12
    print $ "10" `base` 16

str `base` b = readInt b isValidDigit letterToNum str

letterToNum :: Char -> Int
letterToNum d
    | isDigit d = digitToInt d
    | otherwise = ord d - ord 'a' + 10

isValidDigit :: Char -> Bool
isValidDigit d = letterToNum d >= 0


