myAction1 :: IO String
myAction1 = do 
    a <- getLine
    b <- getLine
    return $ a ++ b

myAction2 :: IO String
myAction2 = (++) <$> getLine <*> getLine

sequenceA1 :: (Applicative f) => [f a] -> f [a]
sequenceA1 [] = pure []
sequenceA1 (x:xs) = (:) <$> x <*> sequenceA1 xs
