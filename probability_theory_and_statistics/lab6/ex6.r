# dane z zadania
n <- 450               # wielkosc proby (duza proba)
s <- 0.8               # odchylenie standardowe z proby
poziom_ufnosci <- 0.99

# obliczamy alfa
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha (dla rozkladu normalnego)
# dla 0.99 bedzie to okolo 2.576
z_kwantyl <- qnorm(1 - alfa / 2)

# liczymy blad standardowy dla odchylenia standardowego
# przy duzej probie uzywamy wzoru: s / sqrt(2 * n)
blad_std_s <- s / sqrt(2 * n)

# liczymy margines bledu
margines_bledu <- z_kwantyl * blad_std_s

# wyznaczamy dolna i gorna granice przedzialu dla sigma
dolna_granica <- s - margines_bledu
gorna_granica <- s + margines_bledu

# wyswietlamy wynik
wynik <- c(dolna_granica, gorna_granica)
print(wynik)