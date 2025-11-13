list = [a - b | a <- [1..5], b <- [1..5], b < a, even(a + b)]
f = (^2)
num = reverse (take 5 (0 : [] ++ [2..])) !! 3
zipped = zip [1..] (reverse (take 3 (2 : [2..])))
multiply = [a * b | a <- [1..8], b <- [1..8], b <= a, odd(a - b)]


sumSquares = loop 0
  where 
    loop acc [] = acc 
    loop acc (x:xs) = loop (acc + x^2) xs

neverEndingStory x = neverEndingStory (x + 1) `mod` 100

xs = [1..5]
