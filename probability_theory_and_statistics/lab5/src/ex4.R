# dane (dowolne liczby)
x <- c(0, 1, 2, 3, 4, 5, 6, 7)
n <- c(12, 20, 27, 18, 7, 3, 2, 1)

# 1. liczba obserwacji i estymata lambda
N <- sum(n)
lambda_hat <- sum(x * n) / N
lambda_hat

# 2. estymowany rozkład prawdopodobieństwa Poissona
p_theor <- dpois(x, lambda_hat)

# 3. dystrybuanta (funkcja rozkładu)
F_theor <- ppois(x, lambda_hat)

# 4. prawdopodobieństwo, że X < 2
P_less_2 <- ppois(1, lambda_hat)
P_less_2

# 5. (opcjonalnie) wyniki w tabeli
result <- data.frame(
  x = x,
  observed_freq = n,
  observed_prob = n / N,
  poisson_prob = round(p_theor, 4),
  cdf = round(F_theor, 4)
)
print(result)
