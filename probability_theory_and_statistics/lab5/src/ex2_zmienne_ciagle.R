# Funkcja, którą całkujemy
g <- function(x) {
  (x - 2)^2 + 1
}

# Liczba próbek Monte Carlo
n <- 1e6

# Losowanie próbek z rozkładu jednostajnego na [0,10]
x <- runif(n, min = 0, max = 10)

# Przybliżenie całki
integral_mc <- 10 * mean(g(x))

# Wynik
cat("Przybliżona wartość całki metodą Monte Carlo:", integral_mc, "\n")
