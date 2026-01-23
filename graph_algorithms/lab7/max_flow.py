from checker import maxflow_checker
import networkx as nx

def zad2(V, E):
    G = nx.DiGraph()
    for u, v, cap in E:
        G.add_edge(u, v)
        G[u][v]['capacity'] = cap

    return nx.maximum_flow(G, 1, V)[0]


maxflow_checker(zad2)