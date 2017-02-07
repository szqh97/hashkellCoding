module KMeansCore where

data Poin = Point ! Double ! Double deriving (Show, Eq)

zeroPoin :: Point
zeroPoin = Point 0 0

sqDistance :: Point -> Point -> Double 
sqDistance (Point x1, y1) (Point x2 y2) = ((x1-x2)^2) + ((y1-y2)^2)


