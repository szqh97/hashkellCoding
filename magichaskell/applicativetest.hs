replicateThreef :: Maybe (a -> [a])
replicateThreef = fmap replicate (Just 3)

applyMaybe :: Maybe (a -> b) -> Maybe a -> Maybe b
applyMaybe (Just f) (Just x) = Just (f x)
applyMaybe _ _ = Nothing

addAll :: Int -> Int -> Int -> Int
addAll x y z = x + y + z
