# a) Tworzymy dwa wektory i macierz z dwóch kolumn
x <- 1:10
y <- seq(2, 20, by = 2)
A <- cbind(x, y)

# Transpozycja macierzy A
A_T <- t(A)

# Iloczyn macierzy transponowanej A przez wektor y
result_a <- A_T %*% y

# b) Tworzymy macierz symetryczną 3x3 i wektor b
A_sym <- matrix(c(5, 1, 1,
                  1, 4, 2,
                  1, 2, 6), nrow = 3, byrow = TRUE)
A_sym <- (A_sym + t(A_sym))/2
b <- c(7, 8, 9)

# Wyznacznik macierzy A_sym
det_A <- det(A_sym)

# Rozwiązanie układu równań Ax = b
x_sol <- solve(A_sym, b)
print(x_sol)

# c) Dołączamy kolumnę i wiersz do macierzy
c <- c(3, 2, 1)
B <- cbind(A_sym, c)
d <- c(10, 11, 12, 13)
G <- rbind(B, d)

# d) Dodajemy etykiety kolumn i wierszy
colnames(G) <- c("róża", "tulipan", "krokus", "goździk")
rownames(G) <- c("ala", "ola", "ula", "ela")

# Sprawdzamy wymiar macierzy G
dim_G <- dim(G)

# e) Tworzymy macierz liczbową 3x3 z etykietami
M <- matrix(1:9, nrow = 3, byrow = TRUE,
            dimnames = list(c("W1","W2","W3"), c("K1","K2","K3")))

# f) Tworzymy tablicę 3x5x1 z wektora x (dopasowane wymiary do długości wektora)
Z <- array(x, dim = c(2,5,1))

# Alternatywnie ustawiamy wymiary wektora x bezpośrednio
dim(x) <- c(2,5,1)
Z_dim <- x
