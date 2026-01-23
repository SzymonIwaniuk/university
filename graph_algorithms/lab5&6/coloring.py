def getChromaticNumber(G, peo):
    colors = {}
    
    for v in peo:
        neighbors = G[v].out
        used_colors = {colors[u] for u in neighbors if u in colors}
        
        c = 1
        while c in used_colors:
            c += 1
        colors[v] = c
        
    if not colors:
        return 0
    return max(colors.values())
