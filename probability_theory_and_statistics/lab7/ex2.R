# Zadanie 2
# Automat produkuje blaszki o nominalnej grubości 0.04 mm.
# Próba n=25, x_bar=0.037, s=0.005.
# Czy blaszki są cieńsze? (H1: m < 0.04)
# Rozkład normalny, alpha = 0.01.

# DANE
mu0 <- 0.04
n <- 25
x_bar <- 0.037
s <- 0.005
alpha <- 0.01

# H0: m = 0.04
# H1: m < 0.04 (lewostronna)

# Statystyka testowa (Model II - nieznane sigma, mała próba, rozkład normalny)
# t = (x_bar - mu0) / (s / sqrt(n))
t_stat <- (x_bar - mu0) / (s / sqrt(n))

# Obszar krytyczny (lewostronny)
# (-inf, -t_{1-alpha}]
# Stopnie swobody: n - 1
df <- n - 1
t_kryt <- qt(1 - alpha, df) # kwantyl rzędu 1-alpha

cat("Zadanie 2\n")
cat("Wartość statystyki t:", t_stat, "\n")
cat("Wartość krytyczna t (dla alpha=", alpha, "): ", -t_kryt, "\n", sep="")
cat("Przedział krytyczny: (-inf, ", -t_kryt, "]\n", sep="")

if (t_stat <= -t_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Blaszki są istotnie cieńsze niż 0.04 mm.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
