from data import runtests
import math
from collections import deque
import sys

# UTILS 
sys.setrecursionlimit(20000)

def solve(scores):
    def bfs():
        for j in range(node_count): level[j] = -1
        level[S] = 0
        q = deque([S])
        while q:
            u = q.popleft()
            d_next = level[u] + 1
            for v, cap, rev in graph[u]:
                if cap > 1e-9 and level[v] == -1:
                    level[v] = d_next
                    q.append(v)
        return level[T] != -1

    def dfs(u, flow, ptr):
        if u == T or flow <= 1e-9: return flow
        adj = graph[u]
        for i in range(ptr[u], len(adj)):
            v, cap, rev = adj[i]
            if level[v] == level[u] + 1 and cap > 1e-9:
                pushed = dfs(v, min(flow, cap), ptr)
                if pushed > 1e-9:
                    adj[i][1] -= pushed
                    graph[v][rev][1] += pushed
                    return pushed
            ptr[u] += 1
        return 0.0
    
    d_map = {}
    for d, c in scores:
        d_map[d] = d_map.get(d, 0) + c
    
    unique_divs = list(d_map.items())
    
    div_to_powers = []
    all_primes = {}
    memo_fact = {}
    
    for d, _ in unique_divs:
        if d in memo_fact:
            powers = memo_fact[d]
        else:
            powers = []
            temp = d
            if temp % 2 == 0:
                p_val = 1
                while temp % 2 == 0:
                    p_val *= 2
                    temp //= 2
                powers.append((2, p_val))

            p = 3
            while p * p <= temp:
                if temp % p == 0:
                    p_val = 1
                    while temp % p == 0:
                        p_val *= p
                        temp //= p
                    powers.append((p, p_val))
                p += 2
            if temp > 1:
                powers.append((temp, temp))
            memo_fact[d] = powers
            
        div_to_powers.append(powers)
        for pr, pv in powers:
            if pr not in all_primes: all_primes[pr] = set()
            all_primes[pr].add(pv)

    node_count = 2 + len(unique_divs)
    p_map = {}
    p_sorted_vals = {pr: sorted(all_primes[pr]) for pr in all_primes}
    for pr in sorted(all_primes.keys()):
        for pv in p_sorted_vals[pr]:
            p_map[(pr, pv)] = node_count
            node_count += 1

    graph = [[] for _ in range(node_count)]
    S, T = 0, 1
    
    for i, (d, c) in enumerate(unique_divs):
        u_div = 2 + i
        if c > 0:
            graph[S].append([u_div, c, len(graph[u_div])])
            graph[u_div].append([S, 0, len(graph[S]) - 1])
        
        for pr, pv in div_to_powers[i]:
            target = p_map[(pr, pv)]
            graph[u_div].append([target, float('inf'), len(graph[target])])
            graph[target].append([u_div, 0, len(graph[u_div]) - 1])

    for pr, vals in p_sorted_vals.items():
        prev_log = 0.0
        for i, pv in enumerate(vals):
            u_p = p_map[(pr, pv)]
            curr_log = math.log10(pv)
            cost = 5.0 * (curr_log - prev_log)
            
            graph[u_p].append([T, cost, len(graph[T])])
            graph[T].append([u_p, 0, len(graph[u_p]) - 1])
            
            if i > 0:
                prev_p = p_map[(pr, vals[i-1])]
                graph[u_p].append([prev_p, float('inf'), len(graph[prev_p])])
                graph[prev_p].append([u_p, 0, len(graph[u_p]) - 1])
            prev_log = curr_log

    level = [-1] * node_count

    while bfs():
        ptr = [0] * node_count
        while True:
            pushed = dfs(S, float('inf'), ptr)
            if pushed <= 1e-9: break

    reachable = [False] * node_count
    q = deque([S])
    reachable[S] = True
    while q:
        u = q.popleft()
        for v, cap, rev in graph[u]:
            if cap > 1e-9 and not reachable[v]:
                reachable[v] = True
                q.append(v)

    ans = 1
    for pr, vals in p_sorted_vals.items():
        best_v = 1
        for pv in vals:
            if reachable[p_map[(pr, pv)]]:
                best_v = pv
        ans *= best_v
    return ans

runtests(solve)