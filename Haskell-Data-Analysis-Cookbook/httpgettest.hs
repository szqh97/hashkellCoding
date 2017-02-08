import Text.XML.HXT.Core
import Text.HandsomeSoup

main :: IO ()
main = do 
    let doc = fromUrl "http://www.baidu.com"
    links <- runX $ doc >>> css "#head " 
    print links
