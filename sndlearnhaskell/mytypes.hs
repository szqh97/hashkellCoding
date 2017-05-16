 --data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

 --surface :: Shape -> Float
 --surface (Circle _ _ r) = pi * r ^ 2
 --surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)
 --
 
 
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x1 - x2) * (abs $ y2 - y1)

--data Person = Person String String Int Float String String deriving (Show)
--
--firstName :: Person -> String
--firstName (Person firstName _ _ _ _ _ ) = firstName
--
--lastName :: Person -> String
--lastName (Person _ lastName _ _ _ _) = lastName
--
--age :: Person -> Int
--age (Person _ _ age _ _ _ ) = age
--
--height :: Person -> Float
--height (Person _ _ _ height _ _) = height
--
--phoneNumber :: Person -> String
--phoneNumber (Person _ _ _ _ num _) = num
--
--flavor :: Person -> String
--flavor (Person _ _ _ _ _ flavor) = flavor

data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
} deriving (Show)

data Car a b c = Car { company ::a,
    model :: b,
    year :: c
    } deriving (Show)
 
data Vector a = Vector a a a deriving (Show)
vplus :: (Num t) =>Vector t -> Vector t ->Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+1) (j+m) (k+n)
