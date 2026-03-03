from checker import sat_checker
import networkx as nx

# wczytywana jest tablica formuł gdzie x v y

def create_implication_graph(E : list):
    G = nx.DiGraph()
    G.add_edges_from(tup for x, y in E for tup in [(-x, y), (-y, x)])

    return G


def sat_2cnf(E):
    G = create_implication_graph(E)
    SCC = nx.strongly_connected_components(G)
    
    for S in SCC:
        negation = {-x for x in S}
        if (negation & S): return False # formuła nie jest spełnialna

    return True


if __name__ == "__main__":
    sat_checker(sat_2cnf)