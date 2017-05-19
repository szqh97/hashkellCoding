import Data.List
import System.IO
import System.Directory

main = do
    handle <- openFile "/tmp/todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "These are your TODO items:"
    putStr $ unlines numberedTasks
    putStrLn "which one you want to delete?"
    numberString <- getLine
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile "/tmp/todo.txt"
    renameFile tempName "/tmp/todo.txt"
