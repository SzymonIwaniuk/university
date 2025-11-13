library(boot)
library(ggplot2)

data("acme")

# Tworzymy szereg rozdzielczy dla kolumny market
# N - ilość danych
# n - ilość przedziałów
N <- length(acme$market)
n <- round(sqrt(N))  # <- heurystka n = sqrt(N)

# Dzielimy dane na przedziały
market_cut <- cut(acme$market, n)
freq <- table(market_cut)

# Wyświetlamy rozkład częstości
freq # <- szereg rozdzielczy liczebności
freq / sum(freq) # <- szereg rozdzielczy częstości

# wykres słupkowy
ggplot(data.frame(freq), aes(x = market_cut, y = Freq)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(title = "Szereg rozdzielczy kolumny market", x = "Przedziały", y = "Częstość") +
  theme_minimal()

