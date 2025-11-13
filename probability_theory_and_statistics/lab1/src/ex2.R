# a) tworzymy listę z różnymi typami danych
wektor_string <- c("A", "B", "C")
macierz_liczbowa <- matrix(1:9, nrow = 3, byrow = TRUE)
macierz_logiczna <- matrix(c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE), nrow = 3)

# lista zawierająca powyższe elementy
list1 <- list(napisy = wektor_string,
              liczby = macierz_liczbowa,
              logika = macierz_logiczna)

# sprawdzamy typ zmiennej list1
class(list1)

# Obliczamy pierwiastek elementów macierzy liczbowej w liście (odwołując się przez nazwę)
sqrt_matrix <- sqrt(list1$liczby)
sqrt_matrix

# -----------------------------------
# b) tworzymy wektory do ramki danych
set.seed(123)  # dla powtarzalności wyników
palenie <- sample(c(TRUE, FALSE), 10, replace = TRUE)  # wektor logiczny
plec <- sample(c("K", "M"), 10, replace = TRUE)       # wektor stringowy
wiek <- sample(1:100, 10, replace = TRUE)             # wektor liczbowy

# tworzymy ramkę danych
badanie <- data.frame(czy_pali = palenie,
                      plec = plec,
                      wiek = wiek)

# sprawdzamy, która kolumna jest numeryczna
sapply(badanie, is.numeric)

# zliczamy ilość kobiet i mężczyzn
table(badanie$plec)
