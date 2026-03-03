# Zadanie 16
# Test zgodności chi-kwadrat z rozkładem normalnym.
# Dane pogrupowane w klasach.
# 0.0-0.2 (50), 0.2-0.4 (128), 0.4-0.6 (245), 0.6-0.8 (286), 0.8-1.0 (134), 1.0-1.2 (90), 1.2-1.4 (67).
# Alpha = 0.01 (99% ufności).

# DANE Z SZEREGU
klasy_granice <- c(0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4)
liczebnosci <- c(50, 128, 245, 286, 134, 90, 67)
n <- sum(liczebnosci)
alpha <- 0.01

# 1. Estymacja parametrów (średnia i odchylenie) z szeregu
srodki <- (klasy_granice[-1] + klasy_granice[-length(klasy_granice)]) / 2
x_bar <- sum(srodki * liczebnosci) / n
s2 <- sum(liczebnosci * (srodki - x_bar)^2) / (n - 1)
s <- sqrt(s2)

cat("Estymowana średnia:", x_bar, "\n")
cat("Estymowane odchylenie:", s, "\n")

# 2. Obliczenie prawdopodobieństw teoretycznych
# Uwaga: Dla dokładności, skrajne przedziały powinny objąć całą resztę (-inf, +inf),
# ale w zadaniu podane są konkretne granice. Użyjemy pnorm dla podanych granic.
# P(a < X < b) = F(b) - F(a)

p_teor <- numeric(length(liczebnosci))
for (i in 1:length(liczebnosci)) {
  a <- klasy_granice[i]
  b <- klasy_granice[i+1]
  p_teor[i] <- pnorm(b, mean = x_bar, sd = s) - pnorm(a, mean = x_bar, sd = s)
}

# Normalizacja p_teor, aby sumowały się do 1 (korekta na ucięte ogony)
# Alternatywnie: traktujemy skrajne klasy jako otwarte. 
# Przyjmijmy podejście z rozszerzeniem skrajnych klas: (-inf, 0.2) oraz (1.2, inf) ?
# Zadanie podaje konkretne "0.0 - 0.2". Skoro to czas, to < 0 niemożliwe.
# Zostawmy tak jak jest, ale znormalizujmy, żeby suma pi = 1 do testu
p_teor <- p_teor / sum(p_teor)

oczekiwane <- n * p_teor

# 3. Statystyka Chi^2
chi2_stat <- sum((liczebnosci - oczekiwane)^2 / oczekiwane)

# 4. Stopnie swobody
# k (klasy) = 7
# p (parametry) = 2 (mean, sd)
# df = k - 1 - p = 4
df <- length(liczebnosci) - 1 - 2
chi2_kryt <- qchisq(1 - alpha, df)

cat("Zadanie 16\n")
cat("Statystyka chi^2:", chi2_stat, "\n")
cat("Wartość krytyczna:", chi2_kryt, "\n")

if (chi2_stat >= chi2_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Rozkład nie jest normalny.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
