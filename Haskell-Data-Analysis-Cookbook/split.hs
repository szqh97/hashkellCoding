import Data.List.Split (splitOn)

main = do
    input <- readFile "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch03/Code06_split/input.txt"
    let ls = lines input 
    print $ ls

    let ws = words $ ls !! 2
    print ws

    let cs = splitOn "," $ ls !! 3
    print cs

    let ds  = splitOn "an" $ ls !! 4
    print ds
