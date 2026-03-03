# Zadanie 15
# Test zgodności chi-kwadrat (Symetria kostki).
# n = 120.
# Wyniki: 1(11), 2(30), 3(14), 4(10), 5(33), 6(22).
# Teoretyczne p = 1/6 dla każdego.
# Alpha = 0.05.

# DANE
obserwowane <- c(11, 30, 14, 10, 33, 22)
n <- sum(obserwowane)
alpha <- 0.05
p_teor <- rep(1/6, 6)
oczekiwane <- n * p_teor

# Chi^2 statystyka
chi2_stat <- sum((obserwowane - oczekiwane)^2 / oczekiwane)

# Stopnie swobody: k - 1 - p (p=0 estymowanych parametrów) => 6 - 1 = 5
df <- 6 - 1
chi2_kryt <- qchisq(1 - alpha, df)

cat("Zadanie 15\n")
cat("Statystyka chi^2:", chi2_stat, "\n")
cat("Obszar krytyczny: [", chi2_kryt, ", inf)\n", sep="")

if (chi2_stat >= chi2_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Kostka nie jest symetryczna.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}

# Weryfikacja
cat("\nWeryfikacja chisq.test:\n")
print(chisq.test(obserwowane))
