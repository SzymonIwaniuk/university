# dane z zadania
srednia_proba <- 5.4   # x_bar
s_hat <- 1.7           # odchylenie standardowe z proby
n <- 100               # wielkosc proby
poziom_ufnosci <- 0.96

# obliczamy alfa (poziom istotnosci)
# jesli ufnosc to 0.96, to alfa wynosi 0.04
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha (dla rozkladu normalnego)
# bierzemy 1 - alfa/2, bo szukamy wartosci dla dwoch koncow rozkladu
z_kwantyl <- qnorm(1 - alfa/2)

# liczymy blad standardowy
# wzor to s / pierwiastek z n
blad_std <- s_hat / sqrt(n)

# liczymy margines bledu
margines_bledu <- z_kwantyl * blad_std

# wyznaczamy dolna i gorna granice przedzialu
dolna_granica <- srednia_proba - margines_bledu
gorna_granica <- srednia_proba + margines_bledu

# wyswietlamy wynik w czytelnej formie
wynik <- c(dolna_granica, gorna_granica)
print(wynik)