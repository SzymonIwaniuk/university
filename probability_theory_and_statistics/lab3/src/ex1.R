# Zadanie 1 — wykres pudełkowy dla acme$market i acme$acme

# Wczytanie danych z pakietu boot
library(boot)
data("acme")

# Podgląd struktury
#str(acme)

# Wykres pudełkowy
boxplot(acme$market, acme$acme,
        names = c("market", "acme"),
        col = c("lightcoral", "lightblue"),
        main = "Wykres pudełkowy dla market i acme",
        xlab = "Wartości",
        las = 1)
