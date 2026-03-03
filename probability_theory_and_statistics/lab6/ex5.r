# dane z zadania
n <- 25                # wielkosc proby
s2 <- 13.5             # wariancja z proby (s kwadrat)
poziom_ufnosci <- 0.90

# obliczamy alfa i stopnie swobody
alfa <- 1 - poziom_ufnosci
df <- n - 1

# szukamy kwantyli rozkladu chi-kwadrat
# uwaga: chi-kwadrat nie jest symetryczny, wiec liczymy dwa rozne kwantyle
chi_lewy <- qchisq(alfa / 2, df = df)          # dla dolnego ogona
chi_prawy <- qchisq(1 - alfa / 2, df = df)    # dla gornego ogona

# wzor na przedzial ufnosci dla wariancji to:
# ((n-1)*s2 / chi_prawy, (n-1)*s2 / chi_lewy)
dolna_granica <- (df * s2) / chi_prawy
gorna_granica <- (df * s2) / chi_lewy

# wyswietlamy wynik
wynik <- c(dolna_granica, gorna_granica)
print(wynik)