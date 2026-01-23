from chordal import get_rn_parent

def maxClique(G, peo):
    rn, _ = get_rn_parent(G, peo)
    max_size = 0
    for v in peo:
        size = len(rn[v]) + 1
        if size > max_size:
            max_size = size
    return max_size
