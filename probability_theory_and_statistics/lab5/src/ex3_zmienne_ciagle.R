# Parametry rozkładu
mu <- 2
sigma <- sqrt(6)

# Przedział
a <- -1
b <- 0

# Prawdopodobieństwo
prob <- pnorm(b, mean = mu, sd = sigma) - pnorm(a, mean = mu, sd = sigma)

cat("Prawdopodobieństwo, że X ∈ [-1,0]:", prob, "\n")
