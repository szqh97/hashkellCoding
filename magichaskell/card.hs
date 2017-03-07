data Card = C_2 | C_3 | C_4 | C_5 | C_6 | C_7 | C_8 |C_9 | C_10 |
            C_J| C_Q | C_K | C_A deriving (Eq, Ord, Enum, Show)
type CardStack = [Card]

{-
countCards :: CardStack -> (Int, CardStack)
countCards cs = (length cs, cs)

sortCards :: CardStack -> ((), CardStack)
sortCards cs = ((), sort cs)

popCards :: CardStack -> (Card, CardStack)
popCards cs = (head cs, tail cs)

pushCards :: CardStack -> Card -> ((), CardStack)
pushCards cs c = ((), c:cs)

-}
newtype State s a = State { runState :: s -> (a, s) }

instance Functor (State s) where
    -- fmap :: (a -> b ) -> f a -> f b
    fmap f fs = State $ \s -> 
                let (a , s') = runState fs s 
                in (f a, s')

instance Applicative (State s) where
    pure a = State $ \s -> (a, s)
    --(<*>) :: State s (a -> b) -> State s a -> State s b
    f <*> fa = State $ \s -> 
                let (fab, s0) = runState f s
                    (a, s1) = runState fa s0
                in (fab a, s1)

instance Monad (State s ) where
    return = pure
    --(>>=) :: State s a -> (a -> State s b) -> State s b
    fa >>= f = State $ \s ->
                let (a, s') = runState fa s 
                in  runState (f a) s'
    

