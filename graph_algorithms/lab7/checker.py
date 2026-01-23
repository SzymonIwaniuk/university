from dimacs import *
import os
from time import time


def sat_checker(f):
    passed = failed = 0

    dir = os.listdir("graphs-lab7/sat")

    i = 0
    a = time()

    for graph in dir:
        print(graph)
        V, E = loadCNFFormula("graphs-lab7/sat/" + graph)
        sol = bool(int(readSolution("graphs-lab7/sat/" + graph)[-1]))
        res = f(E)
        if res == sol:
            print("Test " + str(i) + ": Passed")
            passed += 1
        else:
            print("Test " + str(i) + ": WRONG answer, result = " + str(res) + ", should be: " + str(sol))
            failed += 1
        i += 1
        
    print("Time: " + str(time() - a) + " s")
    print("Passed: " + str(passed))
    print("Failed: " + str(failed))


def planarity_checker(f):
    passed = failed = 0

    dir = os.listdir("graphs-lab7/planarity")

    i = 0
    a = time()

    for graph in dir:
        print(graph)
        V, E = loadWeightedGraph("graphs-lab7/planarity/" + graph)
        sol = bool(int(readSolution("graphs-lab7/planarity/" + graph)))
        res = f(E)
        if res == sol:
            print("Test " + str(i) + ": Passed")
            passed += 1
        else:
            print("Test " + str(i) + ": WRONG answer, result = " + str(res) + ", should be: " + str(sol))
            failed += 1
        i += 1
        
    print("Time: " + str(time() - a) + " s")
    print("Passed: " + str(passed))
    print("Failed: " + str(failed))


def maxflow_checker(f):
    passed = failed = 0

    dir = os.listdir("graphs-lab7/flow")

    i = 0
    a = time()

    for graph in dir:
        print(graph)
        V, E = loadDirectedWeightedGraph("graphs-lab7/flow/" + graph)
        sol = int(readSolution("graphs-lab7/flow/" + graph))
        res = f(V, E)
        if res == sol:
            print("Test " + str(i) + ": Passed")
            passed += 1
        else:
            print("Test " + str(i) + ": WRONG answer, result = " + str(res) + ", should be: " + str(sol))
            failed += 1
        i += 1
        
    print("Time: " + str(time() - a) + " s")
    print("Passed: " + str(passed))
    print("Failed: " + str(failed))