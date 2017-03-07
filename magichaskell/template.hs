headT :: String -> String
headT name = "Welcome" ++ name ++ ".\n"

bodyT :: String -> String
bodyT name = "Welcome to my home. " ++ name ++ " This is the best "

footT :: String -> String
footT name = "Now help your self" ++ name ++ "\n"

greetingMike :: String
greetingMike = headT "Mike" ++ bodyT "Mike" ++ footT "Mike"
{-

renderGreeting = gather <$> headT <*> bodyT <*> footT where  gather x y z = x ++ y ++ z

data Greet = Greet {
    greetHead :: String,
    greetBody :: String,
    greetFoot :: String
} deriving Show

renderGreeting2 :: String -> Greet
renderGreeting2 = Greet <$> headT <*> bodyT <*> footT

renderGreeting3 :: String -> Greet
renderGreeting3 = 
    headT >>= \h ->
        bodyT >>= \b ->
            footT >>= \f ->
                return $ Greet h b f

renderGreeting4 :: String -> Greet
renderGreeting4 = do
    h <- headT
    b <- bodyT
    f <- footT
    return $ Greet h b f

-}
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

renderGreetings :: String -> Greet
renderGreetings = do
    n <- ask
    h <- headT
    b <- bodyT
    f <- local ("Mr. and Mrs. " ++ ) footT
    return $ Greet n h b f

renderGreetinglocal :: String -> Greet 
renderGreetinglocal = do 
    n <- ask
    h <- headT
    (b, f) <- local ("Mr. and Mrs. " ++ ) $ do 
        b' <- bodyT
        f' <- footT
        return (b', f')
    return $ Greet n h b f
