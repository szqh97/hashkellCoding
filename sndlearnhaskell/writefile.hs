import System.IO
import Data.Char
main = do
    contents <- readFile "writefile.hs"
    writeFile "/tmp/t.txt" (map toUpper contents)
    todoItem <- getLine
    appendFile "/tmp/t.txt" (todoItem ++ "\n")

