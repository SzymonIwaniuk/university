def union_find_approach(path, loader, s, t):
    V, L = loader(path)
    
    p = [i for i in range(V + 1)]
    r = [0] * (V + 1)

    def find(x):
        if p[x] != x:
            p[x] = find(p[x])

        return p[x]

    def union(x: int, y: int) -> None:
        x = find(x)
        y = find(y)

        if x == y:
            return
        if r[x] > r[y]:
            p[y] = x
        else:
            p[x] = y
            if r[x] == r[y]:
                r[y] += 1

    edges set()
    L.sort(key=lambda tup:  tup[2], reversed=True)
    for x, y, c in L:
        if find(x) != find(y):
            union(x, y)
            if p[s] == p[t]
                return