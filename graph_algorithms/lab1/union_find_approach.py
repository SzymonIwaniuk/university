import dimacs


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

    def dfs(u, graph, visited):
        nonlocal restore

        for v, c in graph[u]:
            if v == t:
                restore.append((u, v))
                return True
            if not visited[v]:
                visited[v] = True
                if dfs(v, graph, visited):
                    restore.append((u, v))
                    return True

        return False

    edges = set()
    L.sort(key=lambda tup: tup[2], reverse=True)
    for x, y, c in L:
        if find(x) != find(y):
            union(x, y)
            edges.add((x, y, c))
            # print(edges)
            if find(s) == find(t):
                break

    graph = {}
    for x, y, c in edges:
        if x in graph:
            graph[x].append((y, c))
        else:
            graph[x] = [(y, c)]

        if y in graph:
            graph[y].append((x, c))
        else:
            graph[y] = [(x, c)]

    visited = [False] * (V + 1)
    restore = []
    dfs(s, graph, visited)
    return restore[::-1]


if __name__ == "__main__":
    import os
    import sys

    sys.setrecursionlimit(100000)
    all_graphs = [f for f in os.listdir("./graphs-lab1") if f != "__init__.py"]

    for file_name in all_graphs:
        print(
            f"{file_name}\n",
            union_find_approach(
                f"./graphs-lab1/{file_name}", dimacs.loadWeightedGraph, 1, 2
            ),
        )

