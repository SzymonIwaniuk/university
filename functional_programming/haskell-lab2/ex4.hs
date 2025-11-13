import qualified Data.Char as Char 

isPalindrome :: [Char] -> Bool
isPalindrome s = if s == reverse s then True else False  -- isPalindrome "ABBA" = True


capitalized :: [Char] -> [Char]
capitalized (head:tail) = Char.toUpper head: map Char.toLower tail
capitalized [] = []

getElemAtIdx :: [a] -> Int -> a
getElemAtIdx (x:_) 0 = x
getElemAtIdx (_:xs) i = getElemAtIdx xs (i - 1)
