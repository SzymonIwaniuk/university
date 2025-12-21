from functools import cache
from data import runtests
from math import log10


def gcd(a, b):
    while a:
        a, b = b % a, a
    return b

def get_factors(num):
    if num <= 1:
        
    factors = set([1])
def all_factors(scores):
    factors = set([1])

    for d, _ in scores:
        if d <= 1:

def bottom_up(scores):
    scores.sort(key = lambda pair: (pair[0], -pair[1]))
    
    memo = {1: 0}

    for d, luck in scores:
        new_memo = memo.copy()

        for lcm, score in memo.items():
            next_lcm = lcm * d // gcd(lcm, d)
            next_luck = score + luck
            if  next_luck > new_memo.get(next_lcm, float("-inf")):
                new_memo[next_lcm] = next_luck

        memo = new_memo

    return max(memo.items(), key = lambda pair: pair[1] - 5 * log10(pair[0]))[0] 

# input = [
#     (6, 5),
#     (9, 1),
#     (10, 6),
#     (15, 7),
#     (13, 6),
#     (17, 5)]

# print(bottom_up(input))
# def solve(scores):
#     # for d, luck in scores:
#     #     print(f"{d} przynosi {luck} szczęścia")

#     l = len(scores)

#     @cache
#     def rec(i: int, lcm: int):
#         if i == l:
#             return (-5 * log10(lcm), lcm)
        
#         new_lcm = lcm * scores[i][0] // gcd(lcm, scores[i][0])
#         skip, skip_lcm = rec(i + 1, lcm)
#         take, take_lcm = rec(i + 1, new_lcm)
#         take += scores[i][1]

#         if take > skip:
#             return (take, take_lcm)
#         else:
#             return (skip, skip_lcm)


    # best_luck, best_lcm = rec(0, 1)
    # return best_lcm



runtests(bottom_up)
