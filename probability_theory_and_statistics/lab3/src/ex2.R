library(ggplot2)
library(boot)
data("acme")

# Tworzenie wykresu wiolinowego z acme$market i acme$acme
ggplot() +
  geom_violin(aes(y = market, x = "market"), data = acme,
              fill = "lightblue", color = "black", trim = FALSE) +
  geom_boxplot(aes(y = market, x = "market"), data = acme,
               width = 0.1, fill = "white") +
  geom_violin(aes(y = acme, x = "acme"), data = acme,
              fill = "lightcoral", color = "black", trim = FALSE) +
  geom_boxplot(aes(y = acme, x = "acme"), data = acme,
               width = 0.1, fill = "white") +
  labs(
    title = "Wykres wiolinowy dla acme$market i acme$acme",
    x = "Zmienna",
    y = "Wartość"
  ) +
  theme_minimal(base_size = 18)
