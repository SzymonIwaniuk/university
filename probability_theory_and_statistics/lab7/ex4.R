# Zadanie 4
# Szereg rozdzielczy czasu dojazdu.
# Klasy: 0-20, 20-40, 40-60, 60-80, 80-100
# Liczebności: 9, 26, 30, 21, 14
# Czy czas dojazdu przekracza 45 min? (H1: m > 45)
# Alpha = 0.05. Model III (duża próba).

# DANE Z SZEREGU
srodki_klas <- c(10, 30, 50, 70, 90)
liczebnosci <- c(9, 26, 30, 21, 14)
n <- sum(liczebnosci)
mu0 <- 45
alpha <- 0.05

# Obliczenie średniej i odchylenia z szeregu
x_bar <- sum(srodki_klas * liczebnosci) / n

# Wariancja z szeregu: sum( ni * (xi - x_bar)^2 ) / (n-1)
warianty_kwadrat <- (srodki_klas - x_bar)^2
s2 <- sum(liczebnosci * warianty_kwadrat) / (n - 1)
s <- sqrt(s2)

# H0: m = 45
# H1: m > 45 (prawostronna)

# Statystyka testowa (Model III - duża próba, nieznana sigma)
# Przybliżamy rozkładem normalnym (lub t-studenta o wielu stopniach swobody)
# T = (x_bar - mu0) / (s / sqrt(n))
t_stat <- (x_bar - mu0) / (s / sqrt(n))

# Obszar krytyczny (prawostronny)
# [z_{1-alpha}, +inf)  (Dla dużej próby t_alpha -> z_alpha)
# Zadanie sugeruje jednak użycie kwantyla t (funkcja qt)
df <- n - 1
t_kryt <- qt(1 - alpha, df)

cat("Zadanie 4\n")
cat("Liczność n:", n, "\n")
cat("Średnia z próby:", x_bar, "\n")
cat("Odchylenie standardowe s:", s, "\n")
cat("Wartość statystyki t:", t_stat, "\n")
cat("Wartość krytyczna t:", t_kryt, "\n")
cat("Przedział krytyczny: [", t_kryt, ", inf)\n", sep="")

if (t_stat >= t_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Czas dojazdu jest istotnie dłuższy niż 45 min.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
