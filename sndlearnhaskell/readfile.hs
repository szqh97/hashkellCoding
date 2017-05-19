import System.IO
main = do
    handle <- openFile "revline.hs" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
