import Data.Char

filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
  |  p x = x : filter' p xs
  | otherwise = filter' p xs

onlyEven list = filter' even list
onlyOdd list = filter' odd list
onlyUpper string = filter' isUpper string
