applyMaybe :: Maybe a -> (a -> Maybe b ) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

{-
instance Monad Maybe where
    return x = Just x
    Nothing >>= f = Nothing
    Just x >>= f = f x
    fail _ = Nothing
    
-}
