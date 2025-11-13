# Dane
n <- 5
p <- c(0.3, 0.2, 0.5)
fruits <- c("jabłko", "gruszka", "śliwka")

# Generowanie wszystkich możliwych kombinacji (x1 + x2 + x3 = n)
library(gtools)
combs <- combinations(n+1, 3, 0:n, repeats.allowed = TRUE)
combs <- combs[rowSums(combs) == n, ]

# Funkcja do wyliczenia prawdopodobieństwa
multinom_prob <- function(x, p) {
  factorial(sum(x)) / prod(factorial(x)) * prod(p^x)
}

# Prawdopodobieństwa dla każdej kombinacji
probs <- apply(combs, 1, multinom_prob, p = p)

# Tworzymy tabelę
table <- data.frame(combs, prob = probs)
colnames(table) <- c(fruits, "prob")
print(table)

# Rozkłady brzegowe
marginals <- apply(table[,1:3], 2, function(x) tapply(table$prob, x, sum))
print(marginals)


# Kowariancje
# Cov(X,Y)=E[XY]−E[X]E[Y]
cov_matrix <- matrix(0, nrow=3, ncol=3)
for(i in 1:3){
  for(j in 1:3){
    xi <- table[,i]
    xj <- table[,j]
    cov_matrix[i,j] <- sum((xi - sum(xi*table$prob)) * (xj - sum(xj*table$prob)) * table$prob)
  }
}
rownames(cov_matrix) <- colnames(cov_matrix) <- fruits
print(cov_matrix)
