data Profession = Fighter | Archer | Account
data Race = Human | Elf | Orc |Goblin
data PlayerCharacter = PlayerCharacter Race Profession

newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)

newtype Pair b a = Pair {getPair :: (a,b)}

instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x , y)

newtype CoolBool = CoolBool {getCoolBool :: Bool }

helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"

newtype Product a  = Product {getProduct :: a } deriving (Eq, Ord, Read, Show, Bounded)
instance Num a => Monoid (Product a) where
    mempty = Product 1
    Product x `mappend` Product y = Product (x * y)
 
newtype Any = Any {getAny :: Bool} deriving (Eq, Ord, Read, Show, Bounded)

instance Monoid Any where
    mempty = Any False
    Any x `mappend` Any y = Any (x || y)
    {--
instance Monoid Ordering where
    mempty = EQ
    LT `mappend` _ = LT
    EQ `mappend` y = y
    GT `mappend` _ = GT
    --}
lengthCompare :: String -> String ->Ordering
lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)

newtype First a = First  {getFirst :: Maybe a} deriving (Eq, Ord, Read, Show)

instance Monoid (First a ) where
    mempty = First Nothing
    First (Just x) `mappend` _ = First (Just x)
    First Nothing `mappend` x = x
    
