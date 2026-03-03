# Zadanie 12
# Test dla dwóch średnich (znane wariancje).
# Sport (1): sigma1^2 = 440, n1 = 20, x1 = 4080
# Bez sportu (2): sigma2^2 = 620, n2 = 15, x2 = 3610
# Czy uprawianie sportu zwiększa pojemność? H1: m1 > m2.
# Alpha = 0.01.

# DANE
sigma1_sq <- 440
sigma2_sq <- 620
n1 <- 20
x1 <- 4080
n2 <- 15
x2 <- 3610
alpha <- 0.01

# H0: m1 = m2
# H1: m1 > m2 (prawostronna)

# Statystyka Z (Model I)
se <- sqrt(sigma1_sq/n1 + sigma2_sq/n2)
Z <- (x1 - x2) / se

# Obszar krytyczny
# [z_{1-alpha}, +inf)
z_kryt <- qnorm(1 - alpha)

cat("Zadanie 12\n")
cat("Statystyka Z:", Z, "\n")
cat("Przedział krytyczny: [", z_kryt, ", inf)\n", sep="")

if (Z >= z_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Uprawianie sportu zwiększa pojemność płuc.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
