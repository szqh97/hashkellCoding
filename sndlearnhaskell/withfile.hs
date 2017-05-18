import System.IO
withFile' :: FilePath -> IOMode -> (Handle -> IO a ) -> IO a
withFile' path mode f = do
    handle <- openFile path mode
    result <- f handle
    hClose handle
    return result
main = do
    withFile' "withfile.hs" ReadMode (\h -> do
        contents <- hGetContents h
        putStr contents)
