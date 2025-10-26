
# a) Zapis ramki 'badanie' z zadania 2.b do pliku CSV
write.csv(badanie, file = "badanie.csv", row.names = FALSE)

# Wczytanie zapisanych danych do nowej ramki
Nowe_badanie <- read.csv("badanie.csv")
Nowe_badanie

# b) Zapis danych beaver1 z pakietu boot jako plik CSV
# Wczytanie pakietu boot
if(!require(boot)) install.packages("boot")
library(boot)

# Sprawdzenie danych beaver1
head(beaver1)

# Zapis do pliku CSV
write.csv(beaver1, file = "beaver1.csv", row.names = FALSE)

# Wczytanie z powrotem (opcjonalnie)
beaver1_new <- read.csv("beaver1.csv")
head(beaver1_new)


