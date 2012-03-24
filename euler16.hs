-- Haskell for this one.
import Char

main = do
     putStrLn(show(sum (map (digitToInt) (show (2^1000)))))