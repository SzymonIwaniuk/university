# params
n <- 365
p <- 12 / 365
k <- 15

prob_leq <- pbinom(k, size = n, prob = p)

cat("P(X <= 15) =", prob_leq, "\n")
