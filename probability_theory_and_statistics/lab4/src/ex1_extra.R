# Zadanie 1: losowanie punktów w D i sprawdzanie, czy należą do S

set.seed(123)

# D = prostokąt [0,1] x [0,1]
N <- 2
n_points <- 1000  # liczba losowań

# Przykładowy zbiór S = punktów w kole o promieniu 0.3 i środku (0.5,0.5)
is_in_S <- function(x, y) {
  (x - 0.5)^2 + (y - 0.5)^2 <= 0.3^2
}

# Losujemy punkty
x <- runif(n_points, 0, 1)
y <- runif(n_points, 0, 1)

# Sprawdzamy, które punkty są w S
in_S <- is_in_S(x, y)

# Wyciągamy punkty należące do S
points_in_S <- data.frame(x = x[in_S], y = y[in_S])

# Ile punktów udało się znaleźć
cat("Liczba punktów w S:", nrow(points_in_S), "\n")

# Wizualizacja
plot(x, y, col = "grey", pch = 16, main = "Losowanie punktów w D i S")
points(points_in_S$x, points_in_S$y, col = "red", pch = 16)
legend("topright", legend=c("D", "S"), col=c("grey","red"), pch=16)

