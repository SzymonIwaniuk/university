# Zadanie 6.1

# 1) 2 kule białe, trzecia dowolna
# wybieramy 2 białe z 5 i 1 z pozostałych 7 (2 czarne + 5 czerwonych)
p_2_biale <- (choose(5, 2) * choose(7, 1)) / choose(12, 3)
p_2_biale

# 2) czarna przed białą (upraszczając: losujemy 2 różne kule)
# P(czarna i biała) = (2*5)/choose(12,2)
# w połowie przypadków czarna wypada przed białą

p_cb <- (2 * 5) / choose(12, 2) * 0.5
p_cb

