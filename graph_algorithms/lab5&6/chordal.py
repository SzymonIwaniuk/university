def get_rn_parent(G, peo):
    pos = {v: i for i, v in enumerate(peo)}
    rn = {}
    parent = {}
    
    for v in peo:
        neighbors = G[v].out
        rn_v = {u for u in neighbors if pos[u] < pos[v]}
        rn[v] = rn_v
        
        if rn_v:
            parent[v] = max(rn_v, key=lambda u: pos[u])
        else:
            parent[v] = None
            
    return rn, parent

def isChordal(G, peo):
    rn, parent = get_rn_parent(G, peo)
    
    for v in peo:
        p = parent[v]
        if p is not None:
            if not (rn[v] - {p}).issubset(rn[p]):
                return False
    return True
