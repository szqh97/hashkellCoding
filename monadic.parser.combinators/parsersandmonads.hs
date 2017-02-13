class Monad m where
    result :: a -> m a
    bind   :: m a -> (a -> m b) -> m b

instance Monad Parser where
    result v = \inp -> [(v, inp)]
    p `bind` f = \inp -> concat [f v out | (v, out) <- p inp]

class Monad m => MonadOPlus m where
    zero :: m a
    (++) "" m a -> m a -> m a

instance MonadOPlus Parser where
    zero = \inp -> []
    p ++ q = \inp -> (p inp ++ q inp)
    
    
