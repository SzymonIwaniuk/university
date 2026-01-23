# Zadanie 7
# Test dla wariancji (duża próba).
# Szereg rozdzielczy prędkości.
# 70-80: 7, 80-90: 30, 90-100: 40, 100-110: 69, 110-120: 48, 120-130: 6
# Czy odchylenie > 10? (H1: sigma > 10 => sigma^2 > 100)
# Alpha = 0.01.

# DANE Z SZEREGU
srodki <- c(75, 85, 95, 105, 115, 125)
liczebnosci <- c(7, 30, 40, 69, 48, 6)
n <- sum(liczebnosci)
sigma0 <- 10
sigma0_sq <- sigma0^2
alpha <- 0.01

# Obliczenie wariancji z próby
x_bar <- sum(srodki * liczebnosci) / n
s2 <- sum(liczebnosci * (srodki - x_bar)^2) / (n - 1)
s <- sqrt(s2)

# H0: sigma^2 = 100
# H1: sigma^2 > 100 (prawostronna)

# Statystyka testowa (Model II - duża próba)
# Z = (S^2 - sigma0^2) / (sigma0^2 * sqrt(2/n)) ?
# Wzór z pliku: Z = sqrt(n/2) * (S^2/sigma0^2 - 1)  LUB  Z = (S - sigma0) / (sigma0 / sqrt(2n)) ?
# Sprawdźmy wzór z PDF:
# Z = (S^2 - sigma0^2) / (sigma0^2 * sqrt(2/n)) ?? 
# PDF: Z = (n / (n-1) * S^2 - sigma0^2) / (sigma0^2 * sqrt(2/n)) 
# Jednak przy n dużym n/(n-1) ~ 1.
# Czytając PDF:
# Z = ( (n/(n-1))*S^2 - sigma0^2 ) / ( sigma0^2 * sqrt(2/n) ) 
# Uwaga: PDF ma dziwny wzór w mianowniku: sigma0^2 * sqrt(2/n) 
# Zwykle (S^2 - sigma^2) / sqrt(Var(S^2)). Var(S^2) = 2*sigma^4/(n-1).
# Przyjmijmy wzór z PDF (wygląda na standaryzację normalną).

licznik <- (n / (n - 1)) * s2 - sigma0_sq
mianownik <- sigma0_sq * sqrt(2/n)
Z <- licznik / mianownik

# Obszar krytyczny (prawostronny)
# [z_{1-alpha}, +inf)
z_kryt <- qnorm(1 - alpha)

cat("Zadanie 7\n")
cat("Wariancja z próby s^2:", s2, "\n")
cat("Statystyka Z:", Z, "\n")
cat("Wartość krytyczna z:", z_kryt, "\n")

if (Z >= z_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Odchylenie jest istotnie większe niż 10.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
