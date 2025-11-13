# Zadanie 3
# 6-cio ścienna kostka do gry, rzucamy 2 razy, więc
# wszystkich możliwości: 6 * 6, zatem |Ω| = 36
# interesuje nas zdarzenie A, że liczba oczek w drugim rzucie jest
# o 1 większa od liczby oczek w pierwszym  rzucie
# sukcesy: (1,2), (2,3), (3,4), (4,5), (5,6) → 5 przypadków
# zatem |A| = 5
# P(A) = |A|/|Ω| = 5/36
p <- 5 / 36
p
