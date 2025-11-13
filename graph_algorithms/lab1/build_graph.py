import dimacs
from pathlib import Path

def build_graph(path: str, loader):
    V, L = loader(path)
    graph = [[] for _ in range(V + 1)]
    
    if loader.__name__ == "loadWeightedGraph":
        for x, y, c in L:
            graph[x].append((y, c))
            graph[y].append((x, c))

    elif loader.__name__ == "loadDirectedWeightedGraph":
        for x, y, c in L:
            graph[x].append((y, c))

    return graph

if __name__ == "__main__":
    print(build_graph("/home/szymon/Desktop/pliki/university/graph_algorithms/lab1/graphs-lab1/g1", dimacs.loadWeightedGraph))
    print(build_graph("/home/szymon/Desktop/pliki/university/graph_algorithms/lab1/graphs-lab1/clique5", dimacs.loadDirectedWeightedGraph))