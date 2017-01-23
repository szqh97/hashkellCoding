#!/usr/local/bin/runhaskell

{-
main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
-}


{-
main = do 
    a <- return "hell"
    b <- return "Yeadh"
    putStrLn $ a ++ " " ++ b
-}

import Control.Monad
main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main
