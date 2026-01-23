def getVertexCover(G, peo):
    I = set()
    
    for v in reversed(peo):
        neighbors = G[v].out
        if not (neighbors & I):
            I.add(v)
            
    num_vertices = len(G) - 1
    return num_vertices - len(I)
