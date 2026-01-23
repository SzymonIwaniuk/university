"""
https://www.w3schools.com/dsa/dsa_algo_graphs_fordfulkerson.php
"""

from collections import deque
from typing import List, Tuple
from graph_builder import build_graph
import dimacs

def dfs(s: int, t: int, V: int, graph: List[List[int]], path=None, visited=None) -> List[int]:
    if visited is None:
        visited = [False] * (V + 1)
    if path is None:
        path = []

    visited[s] = True
    path.append(s)

    if s == t:
        return path

    for v, val in enumerate(graph[s]):
        if not visited[v] and val > 0:
            result_path = dfs(v, t, V, graph, path.copy(), visited)
            if result_path:
                return result_path

    return None


def ford_fulkerson(_path: str, loader: str, source: int, sink: int) -> int:
    V, L = loader(_path)
    graph = build_graph(_path, loader)

    max_flow = 0
    path = dfs(source, sink, V, graph)

    while path:
        path_flow = float('inf')

        v = sink
        for i in range(len(path) - 1):
            u, v = path[i], path[i+1]
            path_flow = min(path_flow, graph[u][v])
    

        for i in range(len(path) - 1):
            u, v = path[i], path[i + 1]
            graph[u][v] -= path_flow
            graph[v][u] += path_flow

        max_flow += path_flow
        path = dfs(source, sink, V, graph)

    return max_flow

if __name__ == '__main__':
    import os

    
    all_graphs = [f for f in os.listdir("./graphs-lab2/flow/") if f != "__init__.py"]

    for file_name in all_graphs:
        print(
            f"{file_name}\n",
            ford_fulkerson(
                f"./graphs-lab2/flow/{file_name}", dimacs.loadDirectedWeightedGraph, 1, 2
            ),
        )

