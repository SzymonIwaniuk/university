# Zadanie 6

# technologia I
# prawdopodobieństwo, że część jest z wadami w I technologii oraz bez wad
p_wad_I <- c(0.05, 0.1, 0.3)# <- z wadami
p_bez_I <- prod(1 - p_wad_I) # <- bez wad

# technologia II
# prawdopodobieństwo, że część jest z wadami w II technologii oraz bez wad
p_wad_II <- c(0.25, 0.25) # <- z wadami
p_bez_II <- prod(1 - p_wad_II) # <- bez wad

# a) porównanie technologii, która ma mniejsze prawdopodobieństwo wytworzenia części bez wady
# wypisanie wyniku w konsoli
cat("P(czesc bez wady) technologia I =", p_bez_I, "\n")
cat("P(czesc bez wady) technologia II =", p_bez_II, "\n")

# b) obliczenie prawdopodobieństwa, że wylosowana część jest bez wad
# zakładamy, że wybór technologii jest losowy z prawdopodobieństwem 0.5 (rozkładem równomiernym)
p_bez_losowa <- 0.5 * p_bez_I + 0.5 * p_bez_II
p_bez_losowa

