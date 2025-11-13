# params
n <- 1600
p <- 0.08
k <- 100

prob_exact <- dbinom(k, size = n, prob = p)

cat("P(X = 100) =", prob_exact, "\n")

prob_leq <- pbinom(k, size = n, prob = p)

cat("P(X <= 100) =", prob_leq, "\n")
