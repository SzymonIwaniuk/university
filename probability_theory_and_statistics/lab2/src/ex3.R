library(boot)
library(ggplot2)

data("acme")

# Funkcja dzieląca dane numeryczne na proporcje
custom_cut <- function(x, proportions) {
  # Kontrola sumy proporcji do 1
  if (abs(sum(proportions) - 1) > 1e-8) stop("Proporcje muszą sumować się do 1")
  # Obliczenie kumulacyjnych kwantyli
  probs <- cumsum(c(0, proportions))
  # Wyznaczenie granic przedziałów
  breaks <- quantile(x, probs = probs)
  # Podział danych według przedziałów
  cut(x, breaks = breaks, include.lowest = TRUE)
}

# Przykład: 10%, 20%, 30%, 20%, 10%, 10%
market_cut <- custom_cut(acme$market, c(0.1, 0.2, 0.3, 0.2, 0.1, 0.1))
freq_custom <- table(market_cut)

# Wykres słupkowy
ggplot(data.frame(freq_custom), aes(x = market_cut, y = Freq)) +
  # Dodanie etykiet
  geom_bar(stat = "identity", fill = "darkblue") +
  # Dodanie etykiet na słupkach
  labs(title = "Rozkład według proporcji", x = "Przedziały", y = "Częstość") +
  # Ustawienie motywu na minimalny
  theme_minimal()
