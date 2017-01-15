main :: IO ()
main = interact wordCoun
    where wordCoun input  = show (length(lines input)) ++ "\n"
