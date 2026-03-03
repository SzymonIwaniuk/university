# Zadanie 4
# Narysuj wykres funkcji regresji oraz krzywe ufności (0.95).
# Bazując na danych z Zadania 3.

x <- 1:8
y <- c(39.7, 38.2, 34.7, 33.1, 30.1, 28.4, 26.3, 24.7)

# Model
model <- lm(y ~ x)

cat("Zadanie 4\n")
cat("Generowanie wykresu regresji z przedziałem ufności...\n")

# Predykcja przedziałów ufności dla zakresu x
# Tworzymy nowe dane dla x (sekwencja dla gładkiego wykresu, lub tylko punkty x)
new_x <- data.frame(x = seq(min(x), max(x), length.out = 100))
prediction <- predict(model, newdata = new_x, interval = "confidence", level = 0.95)

# Rysowanie (podstawowy R plot)
plot(x, y, main = "Regresja liniowa: Zachorowania na gruźlicę",
     xlab = "Rok (indeks 1-8)", ylab = "Liczba zachorowań",
     pch = 19, col = "blue")

# Linia regresji
abline(model, col = "red", lwd = 2)

# Linie przedziałów ufności
lines(new_x$x, prediction[, "lwr"], col = "green", lty = 2) # Dolna granica
lines(new_x$x, prediction[, "upr"], col = "green", lty = 2) # Górna granica

legend("topright", legend = c("Dane", "Regresja", "95% CI"),
       col = c("blue", "red", "green"), pch = c(19, NA, NA), 
       lty = c(NA, 1, 2), lwd = c(NA, 2, 1))

cat("Wykres wygenerowany.\n")
