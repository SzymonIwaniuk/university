# Zadanie 10
# Test dwumianowy (dokładny).
# 10 rzutów, 8 orłów. (n=10, k=8).
# Czy moneta jest niesymetryczna? H1: p != 0.5.
# Alpha = 0.05.

# DANE
n <- 10
k <- 8
p0 <- 0.5
alpha <- 0.05

# Używamy funkcji binom.test
test <- binom.test(k, n, p = p0, alternative = "two.sided", conf.level = 1 - alpha)

cat("Zadanie 10\n")
print(test)

if (test$p.value <= alpha) {
  cat("Decyzja: ODRZUCAMY H0. Moneta jest niesymetryczna.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
