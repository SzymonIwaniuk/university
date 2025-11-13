primes :: [Int]
primes = eratoSieve [2..]
  where
    eratoSieve :: [Int] -> [Int]
    eratoSieve (p:xs) = p: eratoSieve [x | x <- xs, x `mod` p /= 0]


allEqual :: Eq a => [a] -> Bool
allEqual [_] = True
allEqual (x1:x2:xs) =
  if x1 == x2 then allEqual (x2:xs)
  else False
