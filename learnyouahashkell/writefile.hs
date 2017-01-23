import System.IO
import Data.Char

main = do
    contents <- readFile "testcontents.hs"
    writeFile "/tmp/t.hs" (map toUpper contents)
