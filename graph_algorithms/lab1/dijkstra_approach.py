from build_graph import build_graph
from heapq import heappush, heappop
import dimacs


def dijkstra(path, loader, s, t):
    V, L = loader(path)
    graph = build_graph(path, loader)

    queue = [(-float("inf"), s)]
    parent = [None] * (V + 1)
    parent[s] = s
    distances = [float("-inf")] * (V + 1)
    distances[s] = float("inf")

    while queue:
        neg_weight, u = heappop(queue)
        weight = -neg_weight

        if weight < distances[u]:
            continue

        for v, c in graph[u]:
            new_weight = min(weight, c)
            if new_weight > distances[v]:
                distances[v] = new_weight
                parent[v] = u
                heappush(queue, (-new_weight, v))

    u = t
    restore = []
    while u != s:
        if parent[u] is None:
            return None
        restore.append((u, parent[u]))
        u = parent[u]

    restore.reverse()
    return restore


if __name__ == "__main__":
    import os

    all_graphs = [f for f in os.listdir("./graphs-lab1") if f != "__init__.py"]

    for file_name in all_graphs:
        print(
            f"{file_name}\n",
            dijkstra(f"./graphs-lab1/{file_name}", dimacs.loadWeightedGraph, 1, 2),
        )
