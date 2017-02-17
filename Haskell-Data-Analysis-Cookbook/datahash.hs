{-# LANGUAGE DeriveGeneric #-}
import GHC.Generics (Generic)
import Data.Hashable

data Point = Point Int Int deriving (Eq, Generic)
instance Hashable Point

main :: IO()
main = do 
    let p1 = Point 1 1
    let p2 = Point 1 1
    let p3 = Point 3 5

    print $ hash p1
    

