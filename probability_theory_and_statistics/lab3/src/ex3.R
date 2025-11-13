# Zadanie 3 — wykres punktowy (scatterplot)

# potrzebne biblioteki
library(boot)
library(ggplot2)

# wczytywanie danych acme z boot
data("acme")

# A tutaj z wykorzystaniem plot
plot(acme$market, acme$acme,
     main = "Wykres punktowy",
     xlab = "market", ylab = "acme",
     pch = 19, col = "steelblue", cex = 1.3)
grid()

# --- wykres punktowy (scatterplot)---
ggplot(acme, aes(x = market, y = acme)) +
  geom_point(color = "purple", size = 3) +   # zielone punkty, większy rozmiar
  theme_minimal(base_size = 18) +               # minimalistyczny styl i większa czcionka
  labs(
    title = "Scatterplot acme vs market",       # tytuł wykresu
    x = "market",                               # etykieta osi X
    y = "acme"                                  # etykieta osi Y
  )
