library(boot)
library(dplyr)

# Wczytanie danych
data("acme")

# Sprawdzenie struktury danych
str(acme)

# Szereg rozdzielczy - liczba obserwacji w każdym roku
year_counts <- table(acme$year)
year_counts

# Średnia wartości kolumny 'market' w każdym miesiącu
mean_market <- acme %>%
  group_by(month) %>%
  summarise(mean_market = mean(market))

mean_market

