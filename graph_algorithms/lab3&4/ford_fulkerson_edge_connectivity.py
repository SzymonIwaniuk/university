from collections import deque
from typing import List, Tuple
from graph_builder import build_graph
import dimacs
import copy


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


def ford_fulkerson_edge_connectivity(_path: str, loader: str) -> int:
    V, L = loader(_path)
    graph = build_graph(_path, loader)
    min_cut = float('inf')

    # print(graph)
    for source in range(1,V+1):
        for sink in range(source+1, V+1):
            residual_graph = copy.deepcopy(graph)
            max_flow = 0
            path = dfs(source, sink, V, residual_graph)

            while path:
                path_flow = float('inf')

                v = sink
                for i in range(len(path) - 1):
                    u, v = path[i], path[i+1]
                    path_flow = min(path_flow, residual_graph[u][v])
            

                for i in range(len(path) - 1):
                    u, v = path[i], path[i + 1]
                    residual_graph[u][v] -= path_flow
                    residual_graph[v][u] += path_flow

                max_flow += path_flow
                path = dfs(source, sink, V, residual_graph)

            min_cut = min(min_cut, max_flow)

    return min_cut

if __name__ == '__main__':
    import os
    import sys
    import time
    
    # CONFIG 
    sys.setrecursionlimit(20000)

    # UTILS 
    def read_expected_solution(file_path: str) -> int:
        with open(file_path, "r") as f:
            first_line = f.readline().strip()
            if first_line.startswith("c solution"):
                return int(first_line.split('=')[-1].strip())


    all_graphs = [f for f in os.listdir("./graphs-lab3/") if f != "__init__.py"]
    runs = len(all_graphs)
    r = 1
    passed = 0
    failed = 0

    # TESTS 
    print("=" * 60)
    print("RUNTIME TESTS")
    print("=" * 60)
    print(f"\nTesting modified Ford-Fulkerson algorithm to find minimul cut:")
    print("\n" + "=" * 60 + "\n")

    for file_name in all_graphs:
        file_path = f"./graphs-lab3/{file_name}"
        expected_solution = read_expected_solution(file_path)
        t1 = time.time()
        computed_solution = ford_fulkerson_edge_connectivity(file_path, dimacs.loadWeightedGraph)
        t2 = time.time() - t1

        print(f"Run {r}/{runs}")
        print("-" * 60)
        print(f"    Graph: {file_name}")
        print(f"    Expected solution: {expected_solution}")
        print(f"    Computed solution: {computed_solution}")
        print(f"    Time: {t2:.4f}s")
        if expected_solution == computed_solution:
            print(f"    TEST PASSED\n")
            passed += 1
        else:
            print(f"    TEST FAILED\n")
            failed += 1
        
        r += 1

    print("=" * 60)
    print("TEST COMPLETED")
    print("=" * 60)
    print(f"Total graphs tested: {runs}")
    print(f"Passed: {passed}")
    print(f"Failed: {failed}")
    print("=" * 60)