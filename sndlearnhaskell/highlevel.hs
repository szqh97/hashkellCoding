zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = g
    where g x y = f y x

flip1' :: (a -> b ->c) -> b -> a -> c
flip1' f y x = f x y

largestDivisible :: (Integral a ) => a
largestDivisible  = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0

chain :: (Integral a ) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

flip2' :: (a -> b -> c) -> b -> a -> c
flip2' f = \x y -> f y x

sum' :: (Num a ) =>[a] -> a
sum' xs = foldl (\aac x -> aac + x) 0 xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\aac x -> if x == y then True else aac) False ys

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x aac -> f x : aac) [] xs

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x:acc) []

reversef' :: [a] -> [a]
reversef' = foldl (flip (:)) []
