# Zadanie 17
# Test serii (losowość próby).
# Dane: 0.5, 4.1, 2.9, 1.9, 1.4, 4.0, 0.5, 4.4, 4.1, 4.2, 1.1.
# Alpha = 0.05.

dane <- c(0.5, 4.1, 2.9, 1.9, 1.4, 4.0, 0.5, 4.4, 4.1, 4.2, 1.1)
alpha <- 0.05

mediana <- median(dane)
n <- length(dane)

cat("Zadanie 17\n")
cat("Mediana:", mediana, "\n")

# Procedura manualna (wg instrukcji)
# 1. Etykietowanie
etykiety <- ifelse(dane < mediana, "A", ifelse(dane > mediana, "B", NA))
etykiety <- etykiety[!is.na(etykiety)] # Usuwamy równe medianie
nA <- sum(etykiety == "A")
nB <- sum(etykiety == "B")
n_eff <- nA + nB

# 2. Liczenie serii
serie <- 1
if (n_eff > 1) {
  for (i in 2:n_eff) {
    if (etykiety[i] != etykiety[i-1]) {
      serie <- serie + 1
    }
  }
}

cat("Liczba A:", nA, ", Liczba B:", nB, "\n")
cat("Liczba serii K:", serie, "\n")

# Decyzja
# Dla małych prób (nA, nB <= 20) używamy tablic. Tutaj tablic brak.
# Użyjemy przybliżenia normalnego (jak w instrukcji, choć mało dokładne dla małych n)
# E(K) = 1 + (2*nA*nB)/n_eff
# Var(K) = (2*nA*nB * (2*nA*nB - n_eff)) / (n_eff^2 * (n_eff - 1))

E_K <- 1 + (2 * nA * nB) / n_eff
Var_K <- (2 * nA * nB * (2 * nA * nB - n_eff)) / (n_eff^2 * (n_eff - 1))
Z <- (serie - E_K) / sqrt(Var_K)

cat("Oczekiwana liczba serii E(K):", E_K, "\n")
cat("Statystyka Z (przybliżenie):", Z, "\n")

z_kryt <- qnorm(1 - alpha/2)
if (abs(Z) >= z_kryt) {
  cat("Decyzja (Z-approx): ODRZUCAMY H0. Próba nie jest losowa.\n")
} else {
  cat("Decyzja (Z-approx): BRAK PODSTAW DO ODRZUCENIA H0.\n")
}

# Użycie pakietu (rekomendowane w instrukcji)
# lawstat::runs.test
if (require(lawstat)) {
  cat("\nTest pakietem lawstat:\n")
  print(runs.test(dane, plot.it = FALSE, alternative = "two.sided"))
} else if (require(tseries)) {
  cat("\nTest pakietem tseries:\n")
  # tseries::runs.test działa na czynniku (factor)
  print(runs.test(as.factor(etykiety)))
} else {
  cat("\nBrak pakietu lawstat lub tseries - wynik oparty na przybliżeniu normalnym.\n")
}
