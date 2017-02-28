data Position = Position { positionX :: Double, positionY :: Double } deriving (Show, Eq)

setPositionX :: Double -> Position -> Position
setPositionX x p = p {positionX = x}

setPositionY :: Double -> Position -> Position
setPositionY y p = p {positionY = y}

xLens :: Functor f => (Double -> f Double) -> Position -> f Position
xLens f p = fmap (\x -> setPositionX x p) $ f (positionX p)

yLens :: Functor f => (Double -> f Double) -> Position -> f Position
yLens f p = fmap (\y -> setPositionY y p ) $ f (positionY p)

