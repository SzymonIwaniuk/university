# Zadanie 2
p <- 0.3  # np. S zajmuje 30% D
k <- 5    # chcemy co najmniej 5 punktów w S
delta <- 0.95  # gwarancja 95%

# Funkcja, która sprawdza, czy dla n losowań osiągamy delta
prob_at_least_k <- function(n, k, p) {
  1 - pbinom(k - 1, n, p)
}

# Znajdź minimalne n
n <- k
while(prob_at_least_k(n, k, p) < delta) {
  n <- n + 1
}

cat("Minimalna liczba losowań n =", n, "aby osiągnąć co najmniej", k, "punktów z prawd. ≥", delta, "\n")
