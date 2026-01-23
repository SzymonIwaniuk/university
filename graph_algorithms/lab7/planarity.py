from checker import planarity_checker
import networkx as nx

def zad1(E):
    G = nx.Graph()
    G.add_edges_from((u, v) for u, v, _ in E)

    return nx.check_planarity(G)[0]


planarity_checker(zad1)