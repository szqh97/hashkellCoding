import Text.CSV (parseCSV)

main :: IO ()
main = do 
    let fileName = "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch02/Code11_euclid/input.csv"
    input <- readFile fileName
    let csv = parseCSV fileName input
    let points = either (\e -> []) (map toPoint . myFilter) csv
    print points

    let test1 = [2, 1]
    let test2 = [-10, -10]
    
    if (not . null) points then do
        print $ minimum $ map (euclidianDist test1) points
        print $ minimum $ map (euclidianDist test2) points
    else putStrLn "Error: not points to compare"

toPoint record = map (read :: String -> Float) record

euclidianDist p1 p2 = sqrt $ sum $ zipWith (\x y -> (x - y)^2) p1 p2

myFilter = filter (\x -> length x == 2)
