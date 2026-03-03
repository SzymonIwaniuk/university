# Zadanie 14
# Test równości dwóch frakcji.
# Próba 1 (Samochody): n1=800, m1=506
# Próba 2 (Kolej): n2=800, m2=368
# Czy frakcje się różnią? H1: p1 != p2.
# Alpha = 0.05.

# DANE
n1 <- 800
m1 <- 506
n2 <- 800
m2 <- 368
alpha <- 0.05

p1_hat <- m1/n1
p2_hat <- m2/n2

# H0: p1 = p2
# H1: p1 != p2

# Statystyka Z
# p_pool (wskaźnik z połączonych prób)
p_pool <- (m1 + m2) / (n1 + n2)
se <- sqrt(p_pool * (1 - p_pool) * (1/n1 + 1/n2))
Z <- (p1_hat - p2_hat) / se

# Obszar krytyczny
z_kryt <- qnorm(1 - alpha/2)

cat("Zadanie 14\n")
cat("Frakcja 1:", p1_hat, "\n")
cat("Frakcja 2:", p2_hat, "\n")
cat("Statystyka Z:", Z, "\n")
cat("Przedział krytyczny: (-inf, ", -z_kryt, "] U [", z_kryt, ", inf)\n", sep="")

if (abs(Z) >= z_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Frakcje różnią się istotnie.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}

# Weryfikacja
cat("\nWeryfikacja prop.test:\n")
print(prop.test(c(m1, m2), c(n1, n2), alternative = "two.sided", conf.level = 1 - alpha))
