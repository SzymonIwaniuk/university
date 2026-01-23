from checker import maxflow_checker
import networkx as nx

def max_flow(V, E):
    G = nx.DiGraph()
    for u, v, cap in E:
        G.add_edge(u, v)
        G[u][v]['capacity'] = cap

    return nx.maximum_flow(G, 1, V)[0]


if __name__ == "__main__":
    maxflow_checker(max_flow)