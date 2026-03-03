# Zadanie 1
# Rozkład pomiarów głębokości morza w pewnym rejonie jest normalny N(m, sigma=5).
# Próba: 862, 870, 876, 866, 871.
# Weryfikacja hipotezy m = 870 na poziomie istotności alpha = 0.05.

# DANE
sigma <- 5
dane <- c(862, 870, 876, 866, 871)
n <- length(dane)
mu0 <- 870
alpha <- 0.05

# Statystyki z próby
x_bar <- mean(dane)

# H0: m = 870
# H1: m != 870 (dwustronna)

# Statystyka testowa (Model I - znane sigma)
# Z = (X_bar - mu0) / (sigma / sqrt(n))
Z <- (x_bar - mu0) / (sigma / sqrt(n))

# Obszar krytyczny (dwustronny)
# (-inf, -z_{1-alpha/2}] U [z_{1-alpha/2}, +inf)
z_kryt <- qnorm(1 - alpha/2)

cat("Zadanie 1\n")
cat("Średnia z próby:", x_bar, "\n")
cat("Wartość statystyki Z:", Z, "\n")
cat("Wartość krytyczna z:", z_kryt, "\n")
cat("Przedział krytyczny: (-inf, ", -z_kryt, "] U [", z_kryt, ", inf)\n", sep="")

if (abs(Z) >= z_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Średnia głębokość różni się istotnie od 870.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0. Średnia głębokość może wynosić 870.\n")
}

# Weryfikacja pakietem (opcjonalnie, jeśli dostępny, tutaj kod tylko poglądowy)
# require(PASWR)
# z.test(dane, mu = mu0, sigma.x = sigma, conf.level = 1-alpha, alternative = "two.sided")
