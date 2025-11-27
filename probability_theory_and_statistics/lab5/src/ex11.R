# Ω={(w1, w2, w3, w4, w5) wi ∈ {1, 2, 3, 4}}
# sigma algebra = 2^Ω
# 1. Definiujemy prawdopodobieństwa dla każdej grupy
p <- c(28, 23, 22, 27) / 100

# 2. Obliczamy dmultinom dla 4 możliwych przypadków
# x to wektor liczby sukcesów: c(gr1, gr2, gr3, gr4)

case1 <- dmultinom(x = c(2, 1, 1, 1), prob = p) # Dwie osoby z grupy 1
case2 <- dmultinom(x = c(1, 2, 1, 1), prob = p) # Dwie osoby z grupy 2
case3 <- dmultinom(x = c(1, 1, 2, 1), prob = p) # Dwie osoby z grupy 3
case4 <- dmultinom(x = c(1, 1, 1, 2), prob = p) # Dwie osoby z grupy 4

# 3. Sumujemy prawdopodobieństwa (zdarzenia są rozłączne)
wynik <- case1 + case2 + case3 + case4

print(wynik)