import Control.Monad

ns :: IO [Int]
ns = replicateM 3 $ do
    print "Guessing a number:"
    a <- readLn
    if even a then print "Even."
              else print "Odd"
    return a

main :: IO()
main = ns >>= print
