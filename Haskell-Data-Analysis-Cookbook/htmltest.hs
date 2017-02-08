import Text.XML.HXT.Core
import Data.List.Split (chunksOf)

main :: IO ()
main = do 
    input <- readFile "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch01/Code06_html/input.html"
    texts <- runX $ readString [withParseHTML yes, withWarnings no] input
        //> hasName "td"
        //> getText
    let rows = chunksOf 3 texts
    print $ findBiggest rows

findBiggest :: [[String]] -> [String]
findBiggest [] = []
findBiggest items = foldl1 (\a x -> if capacity x > capacity a then x else a) items

capacity [a,b,c] = toInt c
capacity _ = -1

toInt :: String -> Int
toInt = read

