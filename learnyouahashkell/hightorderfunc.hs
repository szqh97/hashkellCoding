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
