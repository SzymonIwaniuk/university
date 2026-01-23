# dane z zadania
d <- 0.08              # dokladnosc 8% (maksymalny blad)
poziom_ufnosci <- 0.90

# skoro nie znamy p z pilota, przyjmujemy p = 0.5
# to daje nam najwieksza mozliwa wartosc n (bezpieczny szacunek)
p_zalozone <- 0.5

# obliczamy alfa
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha (dla rozkladu normalnego)
z_kwantyl <- qnorm(1 - alfa / 2)

# wzor na minimalna liczebnosc proby dla proporcji:
# n = (z^2 * p * (1-p)) / d^2
n_min <- (z_kwantyl^2 * p_zalozone * (1 - p_zalozone)) / (d^2)

# zaokraglamy wynik w gore
n_koncowe <- ceiling(n_min)

# wyswietlamy wynik
print(n_koncowe)

# sprawdzenie funkcja z paswr (jesli masz ja zainstalowana)
# paswr::nsize(z = z_kwantyl, p = 0.5, d = 0.08)