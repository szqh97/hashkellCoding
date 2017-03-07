ask :: a -> a
ask = id

local :: (a -> a) -> (a -> r) -> a -> r
local f g = g . f 

data Greet = Greet {
    guestName :: String,
    greetHead :: String,
    greetBody :: String,
    greetFoot :: String
} deriving Show

renderGreeting :: String -> Greet
renderGreeting = do
    n <- ask
    h <- headT
    b <- bodyT
    f <- local ("Mr. and Mrs. " ++ ) footT
    return $ Greet n h b f
