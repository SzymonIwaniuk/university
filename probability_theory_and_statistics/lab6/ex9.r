# dane z zadania
n0 <- 10               # wielkosc proby pilotazowej
s2 <- 169              # wariancja z proby pilotazowej (s^2)
d <- 5                 # maksymalny blad szacunku
poziom_ufnosci <- 0.95

# obliczamy s (odchylenie standardowe to pierwiastek z wariancji)
s <- sqrt(s2)

# obliczamy alfa i stopnie swobody dla proby pilotazowej
alfa <- 1 - poziom_ufnosci
df <- n0 - 1

# szukamy kwantylu t_alpha (dla rozkladu t-studenta)
t_kwantyl <- qt(1 - alfa / 2, df = df)

# wzor na minimalna liczebnosc proby przy nieznanym sigma:
# n = (t_alpha * s / d)^2
n_min <- (t_kwantyl * s / d)^2

# zaokraglamy wynik w gore
n_koncowe <- ceiling(n_min)

# wyswietlamy wynik
print(n_koncowe)

# opcjonalnie sprawdzenie funkcja z pakietu PASWR
# PASWR::nsize(z = t_kwantyl, sigma = s, d = d)