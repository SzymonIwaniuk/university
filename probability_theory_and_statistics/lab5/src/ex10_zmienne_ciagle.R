# 1. Definiujemy oś X w zadanym przedziale [0.5, 2]
x_vals <- seq(0.5, 2, length.out = 500)

# 2. Obliczamy wartości gęstości dla reprezentatywnych rozkładów F
# Wybieramy pary (k1=k2), aby pokazać zmianę kształtu
y_f1_1 <- df(x_vals, df1 = 1, df2 = 1)
y_f3_3 <- df(x_vals, df1 = 3, df2 = 3)
y_f6_6 <- df(x_vals, df1 = 6, df2 = 6)

# 3. Obliczamy wartości gęstości dla rozkładu normalnego N(0,1)
y_n01 <- dnorm(x_vals, mean = 0, sd = 1)

# 4. Rysowanie wykresu
# Ustawiamy ylim, aby zmieścić wszystkie wykresy (w tym przedziale)
# df(1, 6, 6) ma szczyt blisko 1, dając gęstość ok. 0.61
plot(x_vals, y_f6_6, 
     type = "l", 
     col = "darkgreen", 
     lwd = 2,
     main = "Funkcje gęstości F-Snedecora vs N(0,1)",
     xlab = "Wartość x",
     ylab = "Gęstość prawdopodobieństwa f(x)",
     xlim = c(0.5, 2),
     ylim = c(0, 0.7)) # Ustawiamy limit Y, aby objąć wszystkie krzywe

# 5. Dodawanie pozostałych linii
lines(x_vals, y_f1_1, col = "red", lwd = 2)
lines(x_vals, y_f3_3, col = "blue", lwd = 2)
lines(x_vals, y_n01, col = "black", lwd = 2, lty = 2) # N(0,1) linią przerywaną

# 6. Dodawanie legendy
legend("topleft",
       legend = c("F(1, 1)", "F(3, 3)", "F(6, 6)", "N(0, 1)"),
       col = c("red", "blue", "darkgreen", "black"),
       lwd = 2,
       lty = c(1, 1, 1, 2), # Dopasowanie stylów linii
       title = "Rozkład")

# 7. (Opcjonalnie) Dodanie siatki
grid()
