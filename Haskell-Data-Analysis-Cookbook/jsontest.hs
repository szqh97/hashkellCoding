{-# LANGUAGE OverloadedStrings #-}
import Data.Aeson
import Control.Applicative
import qualified Data.ByteString.Lazy as B

data Mathmatician = Mathmatician {
    name :: String,
    nationality :: String,
    born :: Int,
    died :: Maybe Int
}

instance FromJSON Mathmatician where
    parseJSON (Object v ) = Mathmatician 
                            <$> (v .: "name")
                            <*> (v .: "nationality")
                            <*> (v .: "born")
                            <*> (v .:? "died")


main :: IO ()
main = do
    input <- B.readFile "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch01/Code04_json/input.json"
    --let mm = decode input :: Maybe Mathmatician
    let mm = decode input
    case mm of 
        Nothing -> print "error parsing Json"
        Just m -> (putStrLn . greet) m

greet m = (show . name) m ++ " was born in the year " ++ (show . born) m
