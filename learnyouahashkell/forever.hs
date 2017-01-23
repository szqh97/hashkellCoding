import Data.Char
import Control.Monad

main = forever $ do
    putStr "Give some input:"
    l <- getLine
    putStrLn $ map toUpper l
