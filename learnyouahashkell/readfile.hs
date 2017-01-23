import System.IO
{-
main = do
    handle <- openFile "testcontents.hs" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
-}
{-

main = do 
    withFile "testcontents.hs" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStr contents)
-}

{-
main = do
    contents <- readFile "testcontents.hs"
    putStr contents

-}

main = do 
    withFile "testcontents.hs" ReadMode (\handle -> do
    hSetBuffering handle $ BlockBuffering (Just 2048)
    contents <- hGetContents handle
    putStr contents)
