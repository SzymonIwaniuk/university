sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

sumSqr' :: Num a => [a] -> a
sumSqr' [] = 0
sumSqr' (x:xs) = x^2 + sumSqr' xs

sumWith :: Num a => (a -> a) -> [a] -> a
sumWith f list = sum (map f list) 

sum'' = sumWith (\x -> x) 
sumSqr'' = sumWith (\x -> x*x)
sumCube = sumWith (\x -> x*x*x)
sumAbs = sumWith (\x -> abs(x))
