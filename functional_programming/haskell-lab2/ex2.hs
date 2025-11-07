howMany = sum [1 | a <- [1..100], b <- [1..100], c <- [1..100], a + b > c, a + c > b, b + c > a, a^2 + b^2 == c^2]

