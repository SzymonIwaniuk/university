# Zadanie 4 — wykresy gęstości różnych rozkładów

# 1. Tworzymy wektor wartości x w przedziale [0, 10]
x <- seq(0, 10, length.out = 500)

# 2. Obliczamy wartości gęstości dla trzech rozkładów
# Normalny N(0,3)
y_norm <- dnorm(x, mean = 0, sd = 3)

# Rozkład F(3,6)
y_f <- df(x, df1 = 3, df2 = 6)

# Rozkład chi-kwadrat dla n = 3
y_chi <- dchisq(x, df = 3)

# 3. Rysujemy pierwszy wykres – rozkład normalny
plot(x, y_norm, type = "l", col = "blue", lwd = 2,
     main = "Gęstości rozkładów: N(0,3), F(3,6), χ²(3)",
     xlab = "x", ylab = "Gęstość")

# 4. Dodajemy pozostałe rozkłady na tym samym wykresie
lines(x, y_f, col = "red", lwd = 2, lty = 2)
lines(x, y_chi, col = "darkgreen", lwd = 2, lty = 3)

# 5. Dodajemy legendę
legend("topright",
       legend = c("N(0,3)", "F(3,6)", "Chi-kwadrat(3)"),
       col = c("blue", "red", "darkgreen"),
       lty = c(1, 2, 3),
       lwd = 2)



