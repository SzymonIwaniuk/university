# parametry
mu <- 33      
sigma <- 8        
n <- 16          
x_max <- 35       

# obliczenie bledu standardowego dla sredniej z proby
# odchylenie sredniej =  sigma / sqrt(n)
sigma_sredniej <- sigma / sqrt(n)

# liczymy prawdopodobienstwo uzywajac funkcji pnorm
# pnorm domyslnie liczy szanse na to, ze wartosc bedzie <= x
wynik <- pnorm(x_max, mean = mu, sd = sigma_sredniej)

print(wynik)