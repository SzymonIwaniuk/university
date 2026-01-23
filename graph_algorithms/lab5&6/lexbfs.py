def lexBFS(G):
    V = len(G) - 1
    sets = [{i for i in range(1, V + 1)}]
    visit_order = []
    
    while sets:
        last_set = sets[-1]
        v = last_set.pop()
        visit_order.append(v)
        
        if not last_set:
            sets.pop()
            
        new_sets = []
        for S in sets:
            neighbors = G[v].out
            
            Y = S & neighbors
            K = S - Y
            
            if K:
                new_sets.append(K)
            if Y:
                new_sets.append(Y)
        
        sets = new_sets
        
    return visit_order

def checkLexBFS(G, vs):
    n = len(G)
    pi = [None] * n
    for i, v in enumerate(vs):
        pi[v] = i

    for i in range(n - 1):
        for j in range(i + 1, n - 1):
            Ni = G[vs[i]].out
            Nj = G[vs[j]].out

            verts = [pi[v] for v in Nj - Ni if pi[v] < i]
            if verts:
                viable = [pi[v] for v in Ni - Nj]
                if not viable or min(verts) <= min(viable):
                    return False
    return True
