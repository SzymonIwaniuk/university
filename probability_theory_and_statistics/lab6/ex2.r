# dane z zadania
srednia_proba <- 3.15  # x_bar
sigma <- 0.2           # odchylenie standardowe populacji
n <- 25                # liczba pomiarow
poziom_ufnosci <- 0.95

# obliczamy alfa (poziom istotnosci)
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha (dla rozkladu normalnego)
# dzielimy alfa na dwa, bo przedzial jest obustronny
z_kwantyl <- qnorm(1 - alfa/2)

# liczymy blad standardowy i margines bledu
blad_std <- sigma / sqrt(n)
margines_bledu <- z_kwantyl * blad_std

# wyznaczamy dolna i gorna granice przedzialu
dolna_granica <- srednia_proba - margines_bledu
gorna_granica <- srednia_proba + margines_bledu

# wyswietlamy wynik jako wektor
wynik <- c(dolna_granica, gorna_granica)
print(wynik)