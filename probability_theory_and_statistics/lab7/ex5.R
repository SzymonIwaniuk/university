# Zadanie 5
# Rozwiązanie zadania 4 przy pomocy kodu w R (funkcji wbudowanych).
# Ponieważ nie mamy surowych danych, a jedynie szereg, nie możemy użyć t.test bezpośrednio na wektorze.
# Możemy jednak stworzyć sztuczny wektor danych odpowiadający środkom klas lub użyć obliczonych statystyk.

# Odtworzenie danych (używając środków klas)
srodki_klas <- c(10, 30, 50, 70, 90)
liczebnosci <- c(9, 26, 30, 21, 14)
dane_odtworzone <- rep(srodki_klas, liczebnosci)

mu0 <- 45
alpha <- 0.05

cat("Zadanie 5 (weryfikacja t.test)\n")

# Test t-Studenta
test <- t.test(dane_odtworzone, mu = mu0, alternative = "greater", conf.level = 1 - alpha)
print(test)

if (test$p.value < alpha) {
  cat("Decyzja (z p-value): ODRZUCAMY H0.\n")
} else {
  cat("Decyzja (z p-value): BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
