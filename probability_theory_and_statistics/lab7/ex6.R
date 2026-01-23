# Zadanie 6
# Test dla wariancji (rozkład normalny).
# n = 28, s = 10.5.
# H0: sigma = 12 (czyli sigma^2 = 144)
# H1: sigma != 12 (sigma^2 != 144)
# Alpha = 0.05.

# DANE
n <- 28
s <- 10.5
sigma0 <- 12
sigma0_sq <- sigma0^2
alpha <- 0.05

# Statystyka testowa (Model I)
# chi^2 = (n - 1) * s^2 / sigma0^2
chi2_stat <- (n - 1) * s^2 / sigma0_sq

# Obszar krytyczny (dwustronny)
# (0, chi^2_{alpha/2}] U [chi^2_{1-alpha/2}, +inf)
df <- n - 1
chi2_dolne <- qchisq(alpha/2, df)
chi2_gorne <- qchisq(1 - alpha/2, df)

cat("Zadanie 6\n")
cat("Statystyka chi^2:", chi2_stat, "\n")
cat("Przedział krytyczny: (0, ", chi2_dolne, "] U [", chi2_gorne, ", inf)\n", sep="")

if (chi2_stat <= chi2_dolne || chi2_stat >= chi2_gorne) {
  cat("Decyzja: ODRZUCAMY H0. Odchylenie standardowe różni się istotnie od 12.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
