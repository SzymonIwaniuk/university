# Zadanie 3
# Regresja liniowa: Zachorowania na gruźlicę vs Rok.
# Rok: 1995-2002. Wg przykładu w PDF zakodowane jako 1..8.
# Y: 39.7, 38.2, 34.7, 33.1, 30.1, 28.4, 26.3, 24.7

x <- 1:8
y <- c(39.7, 38.2, 34.7, 33.1, 30.1, 28.4, 26.3, 24.7)
lata <- 1995:2002

cat("Zadanie 3\n")

# Model regresji liniowej y = a*x + b
model <- lm(y ~ x)

# Podsumowanie modelu
print(summary(model))

# Współczynniki
coeffs <- coef(model)
a <- coeffs["x"] # slope
b <- coeffs["(Intercept)"] # intercept

cat("\nRównanie regresji: y =", round(a, 4), "* x +", round(b, 4), "\n")
cat("Dla roku x oznacza kolejny numer od 1995 (1995=1).\n")

# Interpretacja współczynnika kierunkowego
cat("Współczynnik a =", round(a, 4), "oznacza, że średnio liczba zachorowań spada o", abs(round(a, 2)), "rocznie.\n")

# Współczynnik determinacji R^2
r_squared <- summary(model)$r.squared
cat("Współczynnik determinacji R^2:", r_squared, "\n")
cat("Model wyjaśnia", round(r_squared * 100, 2), "% zmienności zmiennej objaśnianej.\n")
