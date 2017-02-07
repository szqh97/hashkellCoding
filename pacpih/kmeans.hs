import KMeansCore
import qualified Data.Vector as Vector
import Data.Vector (Vector)
import qualified Data.Vector.Mutable as MVector

addToPointSum :: PointSum -> Point -> PointSum
addToPointSum (PointSum count xs ys) (Point x y)
    = PointSum (count + 1) (xs + x) (ys + y)

pointSumToCluster :: Int -> PointSum ->Cluster
pointSumToCluster i (PointSum count xs ys) = 
    Cluster { clId = i,
              clCent = Point (xs / fromIntegral count) (ys / fromIntegral count)
            }

assign :: Int -> [Cluster] -> [Point] -> Vector PointSum
assign nclusters clusters points = Vector.create $ do
    vec <- MVector.replicate nclusters (PointSum 0 0 0) 
    let 
        addpoint p = do 
            let c = nearest p; cid = clId c
            ps <- MVector.read vec cid $! addToPointSum ps p
    mapM_ addpoint points
    return vec
 where 
    nearest p = fst $ minimumBy (compare `on` snd)  
                        [ (c, sqDistance (clCent c) p ) | c <- clusters ]

