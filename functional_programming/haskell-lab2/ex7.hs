

prod' :: Num a => [a] -> a
prod' [] = 0
prod' (x:xs) = x * prod' xs

length' :: Num a => [a] -> a
length' [] = 0
length' (x:xs) = 1 + prod' xs

or' :: [Bool] -> Bool
or' [] = True
or' (x:xs) = x || or' xs

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && or' xs

