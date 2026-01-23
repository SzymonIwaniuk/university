# dane z zadania (zamieniamy procenty na ulamki)
p_pilot <- 0.0045    # 0.45% to nasz wstepny odsetek zgonow
d <- 0.01            # 1% to nasz dopuszczalny blad
poziom_ufnosci <- 0.95

# obliczamy alfa
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha dla rozkladu normalnego
# dla ufnosci 0.95 wyjdzie standardowe 1.96
z_kwantyl <- qnorm(1 - alfa / 2)

# wzor na liczebnosc proby dla proporcji:
# n = (z^2 * p * (1-p)) / d^2
n_min <- (z_kwantyl^2 * p_pilot * (1 - p_pilot)) / (d^2)

# zaokraglamy wynik w gore do calosci
n_koncowe <- ceiling(n_min)

# wyswietlamy wynik
print(n_koncowe)

# sprawdzenie opcjonalne funkcja z pakietu paswr
# paswr::nsize(z = z_kwantyl, p = p_pilot, d = d)