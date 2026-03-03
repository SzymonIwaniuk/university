import dimacs
from pathlib import Path

def build_graph(path: str, loader):
    V, L = loader(path)
    graph = [[0 for _ in range(V + 1)]  for _ in range(V + 1)]
    
    if loader.__name__ == "loadWeightedGraph":
        for x, y, c in L:
            graph[x][y] = c
            graph[y][x] = c

    elif loader.__name__ == "loadDirectedWeightedGraph":
        for x, y, c in L:
            graph[x][y] = c

    return graph
