from functools import cache
from data import runtests
from math import log10, prod
from collections import defaultdict


def get_gcd(a, b):
    while a:
        a, b = b % a, a
    return b

def get_lcm(a, b):
    return a * b // get_gcd(a, b)
 
def get_factors(num):
    factors = set()
    if num <= 1:
        return factors

    i = 2
    while i * i <= num:
        if num % i == 0:
            factors.add(i)

        while num % i == 0:
            num //= i

        i += 1

    else:
        factors.add(num)
    
    return factors

def merge(scores):
    merged = defaultdict(lambda: [float('inf'), 0])

    for d, luck in scores:
        key = frozenset(get_factors(d))
        print(key)
        merged[key][0] = min(merged[key][0], d) ; merged[key][1] += luck
    return merged


def bottom_up(scores):
    # scores.sort(key = lambda pair: (pair[0], -pair[1]))
    if len(scores) > 50:
        merged = merge(scores)
    else:
        merged = scores

    memo = {frozenset([1]): 0}
    print(merged)
    for factors, (d, luck) in merged.items():
        new_memo = memo.copy()
        for lcm, score in memo.items():
            next_lcm = get_lcm(lcm, d)
            next_luck = score + luck
            if  next_luck > new_memo.get(next_lcm, float("-inf")):
                new_memo[next_lcm] = next_luck

        memo = new_memo

    return max(memo.items(), key = lambda pair: pair[1] - 5 * log10(pair[0]))[0] 

runtests(bottom_up)
