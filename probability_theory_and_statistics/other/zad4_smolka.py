import math

def probability_generator():
    n = 1
    while n < 366:
        value = 1 - (math.comb(365, n) * math.factorial(n)) / (365 ** n)
        print(n, value)
        if value > 0.5:
            break
        n += 1

probability_generator()