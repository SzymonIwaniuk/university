import sys
import os
import time

sys.path.append(os.path.dirname(__file__))

from dimacs import loadWeightedGraph, loadDirectedWeightedGraph, loadCNFFormula, readSolution
from planarity import planarity
from max_flow import max_flow
from sat_2cnf import sat_2cnf

# CONFIG
sys.setrecursionlimit(20000)

if __name__ == "__main__":
    base_path = os.path.join(os.path.dirname(__file__), 'graphs-lab7')
    

    tasks = [
        ('planarity', planarity, "Planarity Testing", loadWeightedGraph, 'E', lambda x: bool(int(x.split('=')[-1]))),
        ('flow', max_flow, "Maximum Flow", loadDirectedWeightedGraph, 'VE', lambda x: int(x.split('=')[-1])),
        ('sat', sat_2cnf, "SAT-2CNF", loadCNFFormula, 'E', lambda x: bool(int(x.split('=')[-1])))
    ]
    
    print("=" * 60)
    print("LAB 7 RUNTIME TESTS")
    print("=" * 60)
    
    for folder, func, description, loader, input_type, res_converter in tasks:
        print(f"\nTesting {description}:")
        print("\n" + "=" * 60 + "\n")
        
        folder_path = os.path.join(base_path, folder)
        if not os.path.isdir(folder_path):
            print(f"Directory {folder} not found at {folder_path}, skipping.")
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
                expected = res_converter(expected_str)
                
                t1 = time.time()
                
                if loader == loadCNFFormula:
                    V, Data = loader(file_path)
                else:
                    V, Data = loader(file_path)
                
                if input_type == 'E':
                    computed_solution = func(Data)
                elif input_type == 'VE':
                    computed_solution = func(V, Data)
                
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
                import traceback
                traceback.print_exc()
                failed += 1
            
            r += 1
            
        print("=" * 60)
        print(f"TEST COMPLETED for {description}")
        print("=" * 60)
        print(f"Total graphs tested: {runs}")
        print(f"Passed: {passed}")
        print(f"Failed: {failed}")
        print("=" * 60)
