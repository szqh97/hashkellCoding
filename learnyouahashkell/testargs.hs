import System.Environment
import Data.List
main = do
    args <- getArgs
    progName <- getProgName
    putStrLn "then arguments are:"
    mapM putStrLn args 
    putStrLn "the progName is: "
    putStrLn progName
