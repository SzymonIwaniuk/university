from graph_builder import build_graph
import dimacs

def stoer_wagner(path: str, loader: str) -> int:
    V, L = loader(path)
    graph = build_graph(path, loader)

    vertices = list(range(1, V+1))
    min_cut = float('inf')

    while len(vertices) > 1:
        used = [False] * (V + 1)
        weights = [0] * (V + 1)
        prev = -1

        for i in range(len(vertices)):
            sel = -1
            for v in vertices:
                if not used[v] and (sel == -1 or weights[v] > weights[sel]):
                    sel = v
            if sel == -1:
                break

            used[sel] = True

            if i == len(vertices) - 1:
                min_cut = min(min_cut, weights[sel])
                for v in vertices:
                    if v != sel:
                        graph[prev][v] += graph[sel][v]
                        graph[v][prev] += graph[v][sel]
                vertices.remove(sel)
            else:
                for v in vertices:
                    if not used[v]:
                        weights[v] += graph[sel][v]
                prev = sel

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
    print(f"\nTesting Stoer-Wagner algorithm to find minimul cut:")
    print("\n" + "=" * 60 + "\n")

    for file_name in all_graphs:
        file_path = f"./graphs-lab3/{file_name}"
        expected_solution = read_expected_solution(file_path)
        t1 = time.time()
        computed_solution = stoer_wagner(file_path, dimacs.loadWeightedGraph)
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