{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
import Data.Aeson
import qualified Data.ByteString.Lazy as B
import GHC.Generics

data Mathematician = Mathematician { name :: String,
                                     nationality :: String,
                                     born :: Int,
                                     died :: Maybe Int
                                   } deriving Generic
instance FromJSON Mathematician

main = do 
    input <- B.readFile "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch01/Code04_json/input.json"
    let mm = decode input :: Maybe Mathematician
    case mm of 
        Nothing -> print "error parsing Json"
        Just m -> (putStrLn . greet) m
greet m = (show . name) m  ++ " was born in the year " ++ (show . born) m
