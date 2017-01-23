import System.Environment
import System.IO
import System.Directory

main = do (fileName:_) <- getArgs
    fileExists <- doesFileExist fileName
    if fileExists
            then do contents <-readFile fileName
                putStr $ "The file has " ++ show (length (lines contents)) ++ " lines!"
            else do putStrLn "The file doesn't exists"
