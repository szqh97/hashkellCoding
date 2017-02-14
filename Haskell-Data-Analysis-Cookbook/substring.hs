import Data.ByteString (breakSubstring)
import qualified Data.ByteString.Char8 as C

substringFound :: String -> String -> Bool
substringFound query str = (not . C.null . snd) $ breakSubstring (C.pack query ) (C.pack str)

main = do 
    print $ substringFound "Scraf" "sweidsh Scraf mafira"
    print $ substringFound "Flus" "sweidsh Scraf mafira"
