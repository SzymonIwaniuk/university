sumSqr' :: Num a => [a] -> a
sumSqr'	list = sum (map (\x -> x*x) list) 
