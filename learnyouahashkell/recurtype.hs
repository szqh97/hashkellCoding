infixr 5 :-:
data List a = Empty | a :-: (List a ) deriving (Show, Eq, Read, Ord)

--data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Eq, Read)
