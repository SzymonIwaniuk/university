# Zadanie 11
# Test równości dwóch wariancji.
# Próby wzrostu mężczyzn (M) i kobiet (K).
# Sprawdzić, że zmienność M > K (H1: sigma1^2 > sigma2^2).
# Alpha = 0.1.

# DANE
M <- c(171,176,179,189,176,182,173,179,184,186,189,167,177)
K <- c(161,162,163,162,166,164,168,165,168,157,161,172)
alpha <- 0.1

n1 <- length(M)
n2 <- length(K)
s1_sq <- var(M)
s2_sq <- var(K)

# H0: sigma1^2 = sigma2^2
# H1: sigma1^2 > sigma2^2 (prawostronna)

# Statystyka testowa
# F = s1^2 / s2^2 (pod warunkiem s1^2 > s2^2 przy jednostronnym, ale tu hipoteza narzuca kierunek)
F_stat <- s1_sq / s2_sq

# Obszar krytyczny
# [F_{1-alpha}, +inf)
df1 <- n1 - 1
df2 <- n2 - 1
F_kryt <- qf(1 - alpha, df1, df2)

cat("Zadanie 11\n")
cat("Wariancja M:", s1_sq, "\n")
cat("Wariancja K:", s2_sq, "\n")
cat("Statystyka F:", F_stat, "\n")
cat("Wartość krytyczna F:", F_kryt, "\n")

if (F_stat >= F_kryt) {
  cat("Decyzja: ODRZUCAMY H0. Zmienność wzrostu mężczyzn jest istotnie większa.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}

# Weryfikacja
cat("\nWeryfikacja var.test:\n")
print(var.test(M, K, ratio = 1, alternative = "greater", conf.level = 1 - alpha))
