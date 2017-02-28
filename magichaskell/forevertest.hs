import Control.Monad

answer :: String -> String
answer input = case input of
    "Hi"        -> "Hey"
    "Bye."      -> "Bye."
    "What's name"-> "O."
    otherwise -> "Unknown."

main :: IO()
main = forever $ do
    input <- getLine
    putStrLn $ answer input
