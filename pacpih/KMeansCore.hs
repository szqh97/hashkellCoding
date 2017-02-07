module KMeansCore where

data Point = Point ! Double ! Double deriving (Show, Eq)

zeroPoint :: Point
zeroPoint = Point 0 0

sqDistance :: Point -> Point -> Double 
sqDistance (Point x1 y1) (Point x2 y2) = ((x1-x2)^2) + ((y1-y2)^2)


---- Cluster
data Cluster 
    = Cluster { clId    :: Int,
                clCent  :: Point
              }

data PointSum = PointSum !Int !Double !Double

