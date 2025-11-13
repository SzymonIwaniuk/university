# Zadanie 4 – Funkcje, pętle i warunki

# a) Iloczyn skalarny temp i activ z beaver1
library(boot)

dot_product <- 0
for(i in 1:nrow(beaver1)) {
  dot_product <- dot_product + beaver1$temp[i] * beaver1$activ[i]
}
cat("Iloczyn skalarny temp i activ:", dot_product, "\n\n")

# b) Funkcja licząca ilość zerowych współrzędnych w wektorze
count_zeros <- function(vec) {
  count <- 0
  for(val in vec) {
    if(val == 0) count <- count + 1
  }
  return(count)
}

# Test dla funkcji count_zeros
cat("Liczba zer w wektorze c(0,1,0,5,0):", count_zeros(c(0,1,0,5,0)), "\n\n")

# c) Funkcja zwracająca indeks pierwszego i ostatniego TRUE w wektorze logicznym
first_last_true <- function(log_vec) {
  if(any(log_vec)) {
    first <- which(log_vec)[1]
    last <- tail(which(log_vec), 1)
    return(c(first, last))
  } else {
    return(c(NA, NA))
  }
}

# Test
cat("Indeksy pierwszego i ostatniego TRUE w c(FALSE, TRUE, FALSE, TRUE, FALSE):",
    first_last_true(c(FALSE, TRUE, FALSE, TRUE, FALSE)), "\n\n")

# d) Funkcja moda(x) dla tablicy 3x3x3
mode_array <- function(x) {
  v <- as.vector(x)
  freqs <- table(v)
  as.numeric(names(freqs)[which.max(freqs)])
}

# Test
set.seed(1)
x <- array(sample(1:5, 27, replace = TRUE), dim = c(3,3,3))
cat("Tablica 3x3x3:\n")
print(x)
cat("Moda tablicy:", mode_array(x), "\n")

