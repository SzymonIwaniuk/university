# dane z zadania
n <- 200               # wielkosc proby
m <- 20                # liczba sukcesow (osoby chcace odejsc)
poziom_ufnosci <- 0.90

# liczymy frakcje z proby (czyli nasze p z daszkiem)
# 20 osob z 200 to 0.1 czyli 10%
p_proba <- m / n

# obliczamy alfa (poziom istotnosci)
alfa <- 1 - poziom_ufnosci

# szukamy kwantylu z_alpha (dla rozkladu normalnego)
# dla 0.90 z_alpha to okolo 1.645
z_kwantyl <- qnorm(1 - alfa / 2)

# liczymy blad standardowy dla proporcji
# wzor to pierwiastek z (p * (1-p) / n)
blad_std_p <- sqrt((p_proba * (1 - p_proba)) / n)

# liczymy margines bledu
margines_bledu <- z_kwantyl * blad_std_p

# wyznaczamy dolna i gorna granice przedzialu
dolna_granica <- p_proba - margines_bledu
gorna_granica <- p_proba + margines_bledu

# wyswietlamy wynik (proporcje od - do)
wynik <- c(dolna_granica, gorna_granica)
print(wynik)