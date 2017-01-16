doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100 then x else doubleMe x

lucky :: (Integral a) => a->String
lucky 7 = "LUCK NUMER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a ->String
sayMe 1 = "One!"
sayMe 2 = "two"
sayMe 3 = "three"
sayMe 4 = "four"
sayMe 5 = "five"
sayMe x = "Not between 1 and 5"


factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n-1)

fabonacci :: (Integral a) => a -> a
fabonacci 0 = 1
fabonacci 1 = 1
fabonacci n = fabonacci(n-1) + fabonacci(n-2)

charName :: Char -> String 
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName x = x : "xxxxxx" 

addVec1 :: (Num a) =>(a, a) -> (a,a) -> (a, a)
addVec1 a b = (fst a + fst b, snd a + snd b)

addVec2 :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVec2 (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

head' ::[a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

ttell :: (Show a) => [a] -> String
ttell [] = "The list is empty"
ttell (x:[]) = "The list has one element:" ++ show x
ttell (x:y:[]) = "The list has two element: " ++ show x ++ " and " ++ show y
ttell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++" and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell w h 
    | w / h ^ 2 <= 18.5 = "You're under weight, you emo, you"
    | w / h ^ 2 <= 25.0 = "You're supposedly normal. Pfffft, I bet"
    | w / h ^ 2 < 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale congratiulations!"


max' :: (Ord a) => a -> a -> a
max' a b 
    | a > b     = a
    | otherwise = b

myCompare :: (Ord a ) => a -> a -> Ordering
a `myCompare` b 
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 w h 
    | bmi <= skinny = "You're under weight, you emo, you"
    | bmi <= normal = "You're supposedly normal. Pfffft, I bet"
    | bmi < fat = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale congratiulations!"
    where
        bmi = w / h ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height =  weight / height ^ 2

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = 
    let sideArea = 2 * pi * r * h 
        topArea = pi * r ^ 2
    in  sideArea + 2 * topArea

cylinder2 :: (RealFloat a) => a -> a -> a
cylinder2 r h  = sideArea + 2 * topArea
    where sideArea = 2 * pi * r * h
          topArea = pi * r ^ 2

calcBmis2 :: (RealFloat a) => [(a,a)]->[a]
calcBmis2 xs = [bmi | (w,h) <-xs, let bmi = w / h ^2 ]

hea' :: [a] -> a
hea' xs = case xs of [] -> error "No head for empty"
                     (x:_) -> x

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list"
                                               xs -> "a long list"

description :: [a] -> String
description xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          waht xs = "a longer list."
