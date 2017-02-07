import Text.CSV

--
main :: IO ()
main = do
    let fileName = "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch01/Code03_csv/input.csv"
    input <- readFile fileName
    let csv = parseCSV fileName input
    either handleError doWork csv

handleError csv = putStrLn "not a CSV"
doWork csv = (print.findOldest.tail) (filter (\x -> length x == 2) csv)

-- Finds oldest person.
findOldest :: [Record] -> Record
findOldest [] = []
findOldest items = foldl1 (\a x -> if age x > age a then x else a) items

age [a,b] = toInt b

toInt :: String -> Int
toInt = read
