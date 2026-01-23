# Zadanie 8
# Test dla proporcji (wskaźnika struktury).
# p0 = 0.60 (norma żyta).
# Próba n = 120, udział = 48% (p_hat = 0.48).
# Czy udział jest równy normatywnemu? (H1: p != 0.60)
# Alpha = 0.01.

# DANE
p0 <- 0.60
n <- 120
p_hat <- 0.48
alpha <- 0.01

# H0: p = 0.60
# H1: p != 0.60 (dwustronna)

# Statystyka testowa (duża próba)
# Z = (p_hat - p0) / sqrt( p0*(1-p0) / n )
Z <- (p_hat - p0) / sqrt(p0 * (1 - p0) / n)

# Obszar krytyczny (dwustronny)
z_kryt <- qnorm(1 - alpha/2)

cat("Zadanie 8\n")
cat("Frakcja z próby:", p_hat, "\n")
cat("Statystyka Z:", Z, "\n")
cat("Przedział krytyczny: (-inf, ", -z_kryt, "] U [", z_kryt, ", inf)\n", sep="")

if (abs(Z) >= z_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Udział żyta różni się istotnie od normy.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}

# Weryfikacja
cat("\nWeryfikacja prop.test:\n")
k <- round(p_hat * n)
print(prop.test(k, n, p = p0, alternative = "two.sided", conf.level = 1 - alpha))
