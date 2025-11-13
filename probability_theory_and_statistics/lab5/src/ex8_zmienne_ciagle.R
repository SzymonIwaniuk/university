# 1. Definiujemy oś X w zadanym przedziale [-5, 5]
x_vals <- seq(-5, 5, length.out = 500)

# 2. Obliczamy wartości gęstości dla rozkładów t-Studenta
# Parametr 'n' to stopnie swobody (df)
y_t2 <- dt(x_vals, df = 2)
y_t6 <- dt(x_vals, df = 6)
y_t10 <- dt(x_vals, df = 10)

# 3. Obliczamy wartości gęstości dla rozkładu normalnego N(0,1)
y_n01 <- dnorm(x_vals, mean = 0, sd = 1) # lub po prostu dnorm(x_vals)

# 4. Rysowanie wykresu
# Zaczynamy od N(0,1) jako linii bazowej (przerywaną)
# Musimy ustawić ylim, aby zmieściły się wszystkie wykresy (N(0,1) ma szczyt ok. 0.4)
plot(x_vals, y_n01, 
     type = "l", 
     col = "black", 
     lwd = 2,
     lty = 2,  # Linia przerywana (dashed) dla rozkładu normalnego
     ylim = c(0, 0.42), # Ustawiamy limit osi Y, aby szczyt był widoczny
     main = "Funkcje gęstości: t-Student vs N(0,1)",
     xlab = "Wartość x",
     ylab = "Gęstość prawdopodobieństwa f(x)")

# 5. Dodawanie linii dla rozkładów t-Studenta
lines(x_vals, y_t2, col = "red", lwd = 2)
lines(x_vals, y_t6, col = "blue", lwd = 2)
lines(x_vals, y_t10, col = "darkgreen", lwd = 2)

# 6. Dodawanie legendy
legend("topright",
       legend = c("N(0,1)", "t-Student (n=2)", "t-Student (n=6)", "t-Student (n=10)"),
       col = c("black", "red", "blue", "darkgreen"),
       lwd = 2,
       lty = c(2, 1, 1, 1), # Dopasowanie stylów linii
       title = "Rozkład")

# 7. (Opcjonalnie) Dodanie siatki
grid()
