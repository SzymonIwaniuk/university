from collections import deque
from typing import List, Tuple
from graph_builder import build_graph
import dimacs

def bfs(s: int, t: int, V: int, graph: List[List[Tuple[int, int]]], parent: List[int]) -> bool:
    visited = [False] * (V + 1)
    queue = deque()
    queue.append(s)
    visited[s] = True

    while queue: 
        u = queue.popleft()
        
        for v in range(1, V + 1):
            d = graph[u][v]
            if not visited[v] and d > 0:
                visited[v] = True
                parent[v] = u
                if v == t:
                    return True
                queue.append(v)

    return False


def edmond_karp(path: str, loader: str, source: int, sink: int) -> int:
    V, L = loader(path)
    graph = build_graph(path, loader)

    max_flow = 0
    parent = [-1] * (V + 1)

    while bfs(source, sink, V, graph, parent):
        path_flow = float('inf')

        v = sink
        while v != source:
            u = parent[v]
            path_flow = min(path_flow, graph[u][v])
            v = u

        max_flow += path_flow

        v = sink
        while v != source:
            u = parent[v]
            graph[u][v] -= path_flow
            graph[v][u] += path_flow
            v = u
    
    return max_flow


if __name__ == '__main__':
    import os

    
    all_graphs = [f for f in os.listdir("./graphs-lab2/flow/") if f != "__init__.py"]

    for file_name in all_graphs:
        print(
            f"{file_name}\n",
            edmond_karp(
                f"./graphs-lab2/flow/{file_name}", dimacs.loadDirectedWeightedGraph, 1, 2
            ),
        )
