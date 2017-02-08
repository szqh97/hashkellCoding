import Data.Monoid

type Food = String
type Price = sum Int

addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", sum 25)
addDrink "jerky" = ("whiskey", SUm 99)
addDrink _       = ("beer", sum 30)
