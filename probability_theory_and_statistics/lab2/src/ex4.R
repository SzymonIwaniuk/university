library(MASS)

data("catsM")

# Obliczamy różnicę
catsM$diff <- catsM$Bwt - catsM$Hwt

# Miary pozycyjne i zmienności
summary(catsM[, c("Bwt", "Hwt", "diff")])
sapply(catsM[, c("Bwt", "Hwt", "diff")], var)
sapply(catsM[, c("Bwt", "Hwt", "diff")], sd)
sapply(catsM[, c("Bwt", "Hwt", "diff")], IQR)
