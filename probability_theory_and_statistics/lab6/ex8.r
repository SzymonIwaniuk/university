# dane z zadania
sigma <- 1.5           # odchylenie standardowe populacji
d <- 0.5               # maksymalny dopuszczalny blad (margines bledu)
poziom_ufnosci <- 0.99

# obliczamy alfa
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha
# dla poziomu 0.99 bedzie to ok. 2.576
z_kwantyl <- qnorm(1 - alfa / 2)

# wzor na minimalna liczebnosc proby:
# n = (z_alpha * sigma / d)^2
n_min <- (z_kwantyl * sigma / d)^2

# wynik musimy zaokraglic w gore do najblizszej liczby calkowitej
n_koncowe <- ceiling(n_min)

# wyswietlamy wynik
print(n_koncowe)

# opcjonalnie sprawdzamy funkcja z biblioteki PASWR (jesli masz ja zainstalowana)
# install.packages("PASWR")
# PASWR::nsize(z = z_kwantyl, sigma = sigma, d = d)