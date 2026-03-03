# Zadanie 13
# Test dla dwóch średnich (nieznane, równe wariancje).
# A: n1=125, x1=4, s1=1.5
# B: n2=80, x2=5, s2=1.8
# Czy średnia jest w obu populacjach taka sama? H1: m1 != m2.
# Alpha = 0.01.

# DANE
n1 <- 125
x1 <- 4
s1 <- 1.5
n2 <- 80
x2 <- 5
s2 <- 1.8
alpha <- 0.01

# H0: m1 = m2
# H1: m1 != m2

# Obliczenie wspólnego estymatora wariancji Sp^2
sp_sq <- ((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2)
sp <- sqrt(sp_sq)

# Statystyka t
# t = (x1 - x2) / (sp * sqrt(1/n1 + 1/n2))
se <- sp * sqrt(1/n1 + 1/n2)
t_stat <- (x1 - x2) / se

# Obszar krytyczny (dwustronny)
# df = n1 + n2 - 2
df <- n1 + n2 - 2
t_kryt <- qt(1 - alpha/2, df)

cat("Zadanie 13\n")
cat("Statystyka t:", t_stat, "\n")
cat("Przedział krytyczny: (-inf, ", -t_kryt, "] U [", t_kryt, ", inf)\n", sep="")

if (abs(t_stat) >= t_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Średnie różnią się istotnie.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
