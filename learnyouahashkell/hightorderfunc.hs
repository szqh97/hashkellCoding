divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipwith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipwith' _ [] _ = []
zipwith' _ _ [] = []
zipwith' f (x:xs) (y:ys) = f x y : zipwith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

flip2' :: (a ->b -> c) -> b ->a ->c
flip2' f y x = f x y

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x: xs) = f x : map f xs

fileter' :: (a -> Bool) -> [a] -> [a]
fileter' _ [] = []
fileter' f (x: xs)
    | f x       = x : fileter' f xs
    | otherwise = fileter' f xs

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
    | even n = n:chain (n `div` 2)
    | odd n  = n:chain ( n * 3 + 1 )

numLongChain :: Int
numLongChain = length (filter (\xs -> length xs > 15) (map chain[1..100]))

sum' :: (Num a) => [a] -> a
sum' xs = foldl(\acc x -> acc + x) 0 xs

prod' :: (Num a) => [a] ->a
prod' xs = foldl(\p c-> p*c) 1 xs

sum2' :: (Num a ) => [a] ->a
sum2' = foldl (+) 0

elem2' :: (Eq a) => a -> [a] -> Bool
elem2' y ys = foldl (\acc x -> if x == y then True else acc) False ys

last' :: [a] -> a
last' = foldl1 (\_ x->x)

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

($) :: (a -> b) -> a -> b
f $ x = f x
