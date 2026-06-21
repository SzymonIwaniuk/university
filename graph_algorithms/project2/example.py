from data import runtests


def solve(friends, prices):
    n = len(prices)
    adj = [[] for _ in range(n + 1)]
    for u, v in friends:
        adj[u].append(v)
        adj[v].append(u)

    buckets = [[] for _ in range(n)]
    buckets[0] = list(range(1, n + 1))
    deg = [0] * (n + 1)
    processed = [False] * (n + 1)
    peo = [0] * n
    max_d = 0
    
    for i in range(n - 1, -1, -1):
        while True:
            bucket = buckets[max_d]
            if bucket:
                u = bucket.pop()
                if deg[u] == max_d:
                    break
            else:
                max_d -= 1
        
        peo[i] = u
        processed[u] = True
        
        for v in adj[u]:
            if not processed[v]:
                d = deg[v]
                d += 1
                deg[v] = d
                buckets[d].append(v)
                if d > max_d:
                    max_d = d

    pos = [0] * (n + 1)
    for i, u in enumerate(peo):
        pos[u] = i
            
    w = [0] + prices
    
    candidates = []
    
    for u in peo:
        if w[u] > 0:
            candidates.append(u)
            val = w[u]
            for v in adj[u]:
                if pos[v] > pos[u]:
                    w[v] -= val

    is_in_mwis = [False] * (n + 1)
    mwis_weight = 0
    
    for i in range(len(candidates) - 1, -1, -1):
        u = candidates[i] 
        conflict = False
        for v in adj[u]:
            if pos[v] > pos[u]:
                if is_in_mwis[v]:
                    conflict = True
                    break
        
        if not conflict:
            is_in_mwis[u] = True
            mwis_weight += prices[u-1]

    return sum(prices) - mwis_weight

runtests(solve)