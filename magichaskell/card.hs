data Card = C_2 | C_3 | C_4 | C_5 | C_6 | C_7 | C_8 |C_9 | C_10 |
            C_J| C_Q | C_K | C_A deriving (Eq, Ord, Enum, Show)
type CardStack = [Card]

countCards :: CardStack -> (Int, CardStack)
countCards cs = (lenght cs, cs)

sortCards :: CardStack -> ((), CardStack)
sortCards cs = ((), sort cs)

popCards :: CardStack -> (Car)
