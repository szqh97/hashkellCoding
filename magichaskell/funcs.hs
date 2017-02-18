minSubList :: (Num a, Ord a) => [a] -> Int -> a
minSubList xs m = initSum + minDiff
  where
    shifted = drop m xs
    initSum = sum $ take m xs
    minDiff = minimum $ scanl (+) 0 $ zipWith (-) shifted xs

nubl :: Eq a => [a] -> [a]
nubl [] = []
nubl (x:xs) = if x `elem` xs then nubl xs else x:nubl xs

addOneMaybe :: Maybe Int -> Maybe Int
addOneMaybe Nothing = Nothing
addOneMaybe (Just a) = Just (a + 1)

addOneList :: [Int] -> [Int]
addOneList = map (+1)

newtype Identity a = Identity { runIdentity :: a }  deriving Eq

instance Functor Identity where
    --fmap f idx = Identity (f (runIdentity idx))
    fmap f = Identity . f .runIdentity

newtype Const a b = Const { getConst :: a } deriving Eq

instance Functor (Const a) where
    fmap _ (Const v) = Const v

data Position  = Position { positionX :: Double, positionY :: Double }

setPositionX :: Double -> Position -> Position
setPositionX x' p = p {positionX = x'}
