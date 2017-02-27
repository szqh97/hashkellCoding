allArea1 :: [Int]
allArea1 = 
    [1..10] >>= \x->
        [x..10] >>= \y ->
        return (x * y)

allArea2 = do
    x <- [1..10]
    y <- [x..10]
    return (x * y)
