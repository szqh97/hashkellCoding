import Text.XML.HXT.Core

main :: IO ()
main = do
    input <- readFile "/Users/li_yun/Projects/Haskell-Data-Analysis-Cookbook/Ch01/Code05_xml/input.xml"
    dates <- runX $ readString [withValidate no] input
        //> hasName "date"
        //> getText
    print dates
