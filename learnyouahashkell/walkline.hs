type Birds = Int
type Pole = (Birds, Birds)

{-
landLeft :: Birds -> Pole -> Pole
landLeft n (left, right) = (left + n, right)

landRight :: Birds -> Pole -> Pole
landRight n (left, right) = (left, right + n)
-}

x -: f = f x

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n )) < 4 = Just (left, right + n)
    | otherwise                     = Nothing

banana :: Pole -> Maybe Pole
banana _ = Nothing

routine :: Maybe Pole
routine = case landLeft 1 (0, 0) of 
    Nothing -> Nothing
    Just pole1 -> case landRight 4 pole1 of
        Nothing -> Nothing
        Just pole2 -> case landLeft 2 pole2 of
            Nothing -> Nothing
            Just pole3 -> landLeft 1 pole3


foo1 :: Maybe String
foo1 = Just 3   >>= (\x -> 
      Just "!" >>= (\y ->
      Just (show x ++ y)))

foo :: Maybe String
foo = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

marySue :: Maybe Bool
marySue = do
    x <- Just 9
    Just (x > 8)

routine2 :: Maybe Pole
routine2 = do
    start <- return (0, 0)
    first <- landLeft 2 start
    second <- landRight 2 first
    landLeft 1 second

justH :: Maybe Char
justH = do
    (x:xs) <- Just "Hello"
    return x

wopwop :: Maybe Char
wopwop = do 
    (x:xs) <- Just ""
    return x

listOfTuples :: [(Int, Char)]
listOfTuples = do
    n <- [1,2]
    ch <- ['a', 'b']
    return (n, ch)

class Monad m => MonadPlus m where
    mzero :: m a
    mplus :: m a -> m a -> m a

instance MonadPlus [] where
    mzero = []
    mplus = (++)


guard :: (MonadPlus m ) => Bool -> m ()
guard True = return ()
guard False = mzero
    
