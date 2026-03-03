import sys
import os
import time

sys.path.append(os.path.join(os.path.dirname(__file__), 'graphs-lab4'))
from dimacs import loadWeightedGraph, readSolution
from graph import build_graph
from lexbfs import lexBFS, checkLexBFS
from chordal import isChordal
from maxclique import maxClique
from coloring import getChromaticNumber
from vcover import getVertexCover

# CONFIG 
sys.setrecursionlimit(20000)

if __name__ == "__main__":
    base_path = os.path.join(os.path.dirname(__file__), 'graphs-lab4')
    
    tasks = [
        ('chordal', isChordal, "Chordal Graph Recognition"),
        ('maxclique', maxClique, "Max Clique Size"),
        ('coloring', getChromaticNumber, "Graph Coloring"),
        ('vcover', getVertexCover, "Vertex Cover")
    ]
    
    print("=" * 60)
    print("RUNTIME TESTS")
    print("=" * 60)
    
    for folder, func, description in tasks:
        print(f"\nTesting {description}:")
        print("\n" + "=" * 60 + "\n")
        
        folder_path = os.path.join(base_path, folder)
        if not os.path.isdir(folder_path):
            print(f"Directory {folder} not found, skipping.")
            continue
            
        files = sorted([f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f)) and not f.startswith('.')])
        
        runs = len(files)
        r = 1
        passed = 0
        failed = 0
        
        for filename in files:
            file_path = os.path.join(folder_path, filename)
            
            try:
                expected_str = readSolution(file_path)
                expected = int(expected_str)
                
                t1 = time.time()
                
                V, L = loadWeightedGraph(file_path)
                G = build_graph(V, L)
                
                lex_order = lexBFS(G)
                
                if not checkLexBFS(G, lex_order):
                    computed_solution = "LexBFS Invalid"
                else:
                    if folder == 'chordal':
                        computed_solution = 1 if func(G, lex_order) else 0
                    else:
                        computed_solution = func(G, lex_order)
                
                t2 = time.time() - t1
                
                print(f"Run {r}/{runs}")
                print("-" * 60)
                print(f"    Graph: {filename}")
                print(f"    Expected solution: {expected}")
                print(f"    Computed solution: {computed_solution}")
                print(f"    Time: {t2:.4f}s")
                
                if expected == computed_solution:
                    print(f"    TEST PASSED\n")
                    passed += 1
                else:
                    print(f"    TEST FAILED\n")
                    failed += 1
                    
            except Exception as e:
                print(f"Run {r}/{runs}")
                print("-" * 60)
                print(f"    Graph: {filename}")
                print(f"    ERROR: {e}\n")
                failed += 1
            
            r += 1
            
        print("=" * 60)
        print(f"TEST COMPLETED for {description}")
        print("=" * 60)
        print(f"Total graphs tested: {runs}")
        print(f"Passed: {passed}")
        print(f"Failed: {failed}")
        print("=" * 60)
