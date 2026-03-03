data BinTree a = EmptyBT |
                  NodeBT a (BinTree a) (BinTree a)

depthOfBT :: BinTree a -> Int -- głębokość drzewa binarneg
depthOfBT EmptyBT = 0
depthOfBT (NodeBT _ lt rt) = 1 + max (depthOfBT lt) (depthOfBT rt)

mapBT :: (a -> b) -> BinTree a -> BinTree b -- funkcja map dla drzewa binarnego
mapBT _ EmptyBT = EmptyBT
mapBT f EmptyBT (Node BT n lt rt) = NodeBT (f n) (mapBT f lt) (mapBT f rt)

insert :: Ord a => a -> BinTree a -> BinTree a -- insert element into BinTree
insert x EmptyBT = NodeBT x EmptyBT EmptyBT
insert x (NodeBT n lt rt)
    | x < n     = NodeBT n (insert x lt) rt
    | x >= n     = NodeBT n lt (insert x rt)


list2BST :: Ord a => [a] -> BinTree a
list2BST [] = EmptyBT                 -- pustą listę zamieniamy na pusty BST
list2BST (x:xs) = insert x (list2BST xs)  -- rekurencyjnie wstawiamy elementy
