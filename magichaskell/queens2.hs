import Control.Monad

safe :: Int -> [Int] -> Int -> Bool
safe _ [] _ = True
safe x (x1:xs) n = 
    x /= x1
    && x /= x1 + n && x /= x1 - n
    && safe x xs (n+1)

queesN :: Int -> [[Int]]
queesN n = queens n
    where
        queens 0 = [[]]
        queens m = [x:y | y <- queens (m-1), x <- [1..n], safe x y 1]

main :: IO()
main = forM_ [5..10] $ \n->do
    putStrLn $ "Solutions for queens" ++ show n ++ " Problem."
    let solutions = queesN n
    forM_ solutions $ print
