  # Zbierz wszystkie termy z etykietami
  all_terms = []
  for fn, terms in functions.items():
      for term in terms:
          all_terms.append((fn, frozenset(term)))
  # Znajdź powtarzające się termy
  from collections import defaultdict
  term_usage = defaultdict(list)
  for fn, term in all_terms:
      term_usage[term].append(fn)
  print("=== Powtarzające się termy (warto użyć jako wspólne bramki) ===")
  for term, fns in term_usage.items():
      if len(fns) > 1:
          expr = " AND ".join(sorted(term))
          print(f"  {expr}")
          print(f"    → używane w: {', '.join(fns)}")
          print()
  print("=== Wspólne literały między termami różnych funkcji ===")
  pairs_checked = set()
  for (fn1, t1), (fn2, t2) in combinations(all_terms, 2):
      if fn1 == fn2:
          continue
      key = (min(fn1,fn2), max(fn1,fn2), t1, t2)
      if key in pairs_checked:
          continue
      pairs_checked.add(key)
      common = t1 & t2
      if len(common) >= 2:
          expr1 = " AND ".join(sorted(t1))
          expr2 = " AND ".join(sorted(t2))
          shared = " AND ".join(sorted(common))
          print(f"  {fn1}: {expr1}")
          print(f"  {fn2}: {expr2}")
          print(f"  → wspólny podterm: {shared}")
          print()
