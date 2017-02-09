main :: IO()
main = do
    let d1 = [3,3,3,4,4,4,5,5,5]
    let d2 = [1,1,2,2,3,4,4,5,5]

    let r = pearson d1 d2
    print r

pearson xs ys = (n * sumXY - sumX * symY)
