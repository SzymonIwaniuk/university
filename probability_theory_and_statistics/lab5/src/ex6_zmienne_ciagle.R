# 1. Definiujemy oś X zgodnie z poleceniem (od 0 do 20)
# Używamy 500 punktów dla gładkiego wykresu.
x_vals <- seq(0, 20, length.out = 500)

# 2. Obliczamy wartości gęstości (oś Y) dla każdego parametru n (df)
y_n2 <- dchisq(x_vals, df = 2)
y_n6 <- dchisq(x_vals, df = 6)
y_n10 <- dchisq(x_vals, df = 10)

# 3. Rysowanie pierwszego wykresu (n=2)
# Ustawiamy ręcznie limit osi Y (ylim) na c(0, 0.25), aby wykresy n=6 i n=10

plot(x_vals, y_n2, 
     type = "l",             
     col = "blue",           
     lwd = 2,            
     xlim = c(0, 20),       
     ylim = c(0, 0.25),     
     main = "Funkcje gęstości rozkładu chi-kwadrat", # Tytuł główny
     xlab = "Wartość x",    
     ylab = "Gęstość prawdopodobieństwa f(x)") 

# Dodawanie kolejnych wykresów do istniejącego układu
lines(x_vals, y_n6, type = "l", col = "red", lwd = 2)
lines(x_vals, y_n10, type = "l", col = "darkgreen", lwd = 2)

# Dodawanie legendy
legend("topright",                             
       legend = c("n = 2", "n = 6", "n = 10"),   
       col = c("blue", "red", "darkgreen"),    
       lwd = 2,                                  
       title = "Stopnie swobody (n)")            
grid()



