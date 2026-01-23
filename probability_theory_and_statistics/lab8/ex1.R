# Zadanie 1
# Produkt wytwarzany 3 metodami.
# Hipoteza: wadliwość produkcji nie zależy od metody (H0: cechy niezależne).
# H1: cechy są zależne.
# alpha = 0.05.

# Tabela wielodzielcza (dane z tabeli)
# Kolumny: Metoda 1, Metoda 2, Metoda 3
# Wiersze: Jakość dobra, Jakość zła

# Metoda 1: 40 (dobra), 10 (zła)
# Metoda 2: 80 (dobra), 60 (zła)
# Metoda 3: 60 (dobra), 20 (zła)

dane <- matrix(c(40, 80, 60,
                 10, 60, 20), 
               nrow = 2, 
               byrow = TRUE)

rownames(dane) <- c("Dobra", "Zła")
colnames(dane) <- c("Metoda 1", "Metoda 2", "Metoda 3")

cat("Zadanie 1\n")
print(dane)

# Test niezależności chi-kwadrat Pearsona
alpha <- 0.05
test <- chisq.test(dane)

print(test)

# Wartość krytyczna z rozkładu chi-kwadrat
# Stopnie swobody df = (r-1)*(k-1) = (2-1)*(3-1) = 2
df <- 2
chi2_kryt <- qchisq(1 - alpha, df)

cat("Wartość statystyki chi^2:", test$statistic, "\n")
cat("Wartość krytyczna chi^2:", chi2_kryt, "\n")
cat("P-value:", test$p.value, "\n")

if (test$p.value < alpha) {
  cat("Decyzja: ODRZUCAMY H0. Wadliwość zależy od metody produkcji.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
