# dane z zadania
srednia_proba <- 45  
s <- 11               
n <- 25            
poziom_ufnosci <- 0.95

# alfa 1 - pozion_ufnosci
alfa <- 1 - poziom_ufnosci

df <- n - 1

# szukamy kwantyl t_alpha )rozkladu t-studenta
# uzywamy funkcji qt zamiast qnorm
t_kwantyl <- qt(1 - alfa/2, df = df)

# licze blad standardowy i margines bledu
blad_std <- s / sqrt(n)
margines_bledu <- t_kwantyl * blad_std

# wyznaczamy dolna i gorna granice
dolna_granica <- srednia_proba - margines_bledu
gorna_granica <- srednia_proba + margines_bledu

# wyswietlamy wynik
wynik <- c(dolna_granica, gorna_granica)
print(wynik)