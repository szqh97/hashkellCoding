import Data.Char (isSpace)

trim :: String -> String
trim = f . f
    where f = reverse . dropWhile isSpace

main :: IO ()
main = do 
    putStrLn $ trim "   Wahoo xxx !   "
