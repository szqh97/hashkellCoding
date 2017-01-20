import qualified Data.Map as Map

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 -  y1)

{- compile error
data Car a b c = Car {
    company :: a,
    model :: b,
    year :: c
} deriving (Show)

tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) = "this " ++ c ++ " " ++ m ++ " was made in " ++ show y

-}

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k ) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)

scalarMut :: (Num t) => Vector t ->Vector t -> t
(Vector i j k) `scalarMut` (Vector l m n) = i*l + j*m + k*n

data Person = Person {
firstName :: String,
lastName :: String,
age :: Int
} deriving (Eq, Show, Read)

data Day = Monday | Tuesday | Wednesday |Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = 
    case Map.lookup lockerNumber map of 
        Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
        Just (state,code) -> if state /= Taken
                                then Right code
                                else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100, (Taken, "ZD39I")),
     (101, (Free, "JAH3I")),
     (103, (Free, "IQSA9")),
     (105, (Free, "QOTAS")),
     (109, (Taken, "893JJ")),
     (110, (Taken, "99292"))
    ]
data LList a = Empty | Cons { listHead :: a, listTail :: LList a } deriving (Show, Read, Eq, Ord)

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green  = "Green light"
{-
class Eqq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)
-}

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo Bool where
    yesno  = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

instance YesNo TrafficLight where
    yesno Red = False
    yesno _   = True

yesnoIf :: (YesNo y ) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

--instance Functor [] where 
--    fmap = map
--
