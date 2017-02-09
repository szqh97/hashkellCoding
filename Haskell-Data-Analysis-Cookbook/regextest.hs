import Text.Regex.Posix ((=~))

looksLikeName :: String -> Bool
looksLikeName  str = str =~ "^[A-Z][a-z]{1,30}$" :: Bool

punctuations = ['!', '"', '#', '$', '%', '(',')', '.', ',', '?']

removePunctuation = filter (`notElem` punctuations)

specialSymbols = ['/', '-']
replaceSpecialSymbols = map $ (\c -> if c `elem` specialSymbols then ' ' else c)

createTuples (x:y:xs) = (x ++ " " ++ y) : createTuples (y:xs)
createTuples _ = []

main :: IO ()
main = do
  input <- readFile "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch02/Code04_regex/input.txt"
  let cleanInput = (removePunctuation.replaceSpecialSymbols) input
  let wordPairs = createTuples $ words cleanInput
  print wordPairs
  let possibleNames = 
        filter (all looksLikeName . words) wordPairs
  print possibleNames

