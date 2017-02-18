minSubList :: (Num a, Ord a) => [a] -> Int -> a
minSubList xs m = initSum + minDiff
  where
    shifted = drop m xs
    initSum = sum $ take m xs
    minDiff = minimum $ scanl (+) 0 $ zipWith (-) shifted xs

nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = if x `elem` xs then nub xs else x:nub xs
                            
        
