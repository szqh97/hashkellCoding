main :: IO ()
main = do
    let quote = "Deeo Blue Plays very good chess-ss so what?\
        \Does ta fsd. dkks ? sfsf-kdk .fkd(DOu)?\
        \understands a chess bodrd? (Douglas Hofstadter)"
    putStrLn $ (removePunctuation . replaceSpecialSymbols) quote

punctuations = [ '!', '"', '#', '-', '?', '(', ')', '.' ]

removePunctuation = filter (`notElem` punctuations)

specialSymbols = ['/', '-']

replaceSpecialSymbols = map  (\c -> if c `elem` specialSymbols then ' ' else c)
