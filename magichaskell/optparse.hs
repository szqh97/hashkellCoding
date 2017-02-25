import Options.Applicative
import Data.Semigroup ((<>))

data Greet = Greet {hello :: String, quiet :: Bool}

greetParser :: Parser Greet
greetParser = Greet
    <$> strOption
        (long "hello"
        <> metavar "TARGET"
        <> help "Target for the greeting")
    <*> switch
        (long "quiet"
        <> help "whether to be quiet")

main :: IO ()
main = do 
    greet <- execParser $ info greetParser mempty
    case greet of 
        Greet h False -> putStrLn $ "hello, " ++ h
        _             -> return ()
