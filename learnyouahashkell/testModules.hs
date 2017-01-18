import Data.List
import qualified Data.Map as Map
import qualified Data.Set as Set
import Geometry
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack = 
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ]  

findKey :: (Eq k) => k -> [(k,v)] -> v
findKey key xs = snd . head .filter (\(k,v) -> key == k) $ xs

findKKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findkKey key [] = Nothing
findKKey key ((k,v):xs) = if key == k
                             then Just v
                             else findKKey key xs

--
--findKeyr :: (Eq k) => k -> [(k,v)] -> Maybe v
--findKeyr key = foldr (\(k,v) acc -> if key == v then Just v else acc) Nothing
