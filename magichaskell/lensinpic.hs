data Point = Point {_x, _y :: Double} deriving (Eq, Show)
data Mario = Mario { _location :: Point } deriving (Eq, Show)

moveX (Mario (Point xpos ypos)) val = Mario (Point (xpos + val) ypos)
