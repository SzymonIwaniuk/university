# Zadanie 2
# Plony czarnej porzeczki a wiek plantacji.
# X (wiek): 1, 3, 2, 3, 4, 3, 5
# Y (plony): 85, 105, 100, 110, 125, 115, 130
# Zbadać stopień skorelowania (Pearson).

x <- c(1, 3, 2, 3, 4, 3, 5)
y <- c(85, 105, 100, 110, 125, 115, 130)

cat("Zadanie 2\n")

# Współczynnik korelacji
korelacja <- cor(x, y)
cat("Współczynnik korelacji Pearsona r:", korelacja, "\n")

# Interpretacja (wg tabeli z wykładu)
# 0.9 - 1.0 Bardzo wysoki stopień współzależności
if (abs(korelacja) >= 0.9) {
  cat("Interpretacja: Bardzo wysoki stopień współzależności.\n")
} else if (abs(korelacja) >= 0.7) {
  cat("Interpretacja: Wysoki stopień współzależności.\n")
} else if (abs(korelacja) >= 0.5) {
  cat("Interpretacja: Znaczny stopień współzależności.\n")
} else {
  cat("Interpretacja: Średni lub słaby stopień współzależności.\n")
}

# Test istotności współczynnika korelacji
# H0: correlation = 0
# H1: correlation != 0
test <- cor.test(x, y)
print(test)

if (test$p.value < 0.05) {
  cat("Decyzja: ODRZUCAMY H0. Korelacja jest istotna statystycznie.\n")
} else {
  cat("Decyzja: BRAK PODSTAW DO ODRZUCENIA H0.\n")
}
