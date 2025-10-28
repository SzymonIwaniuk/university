n <- 200
p <- 0.05

# dokładnie (dwumianowo)
p_exact <- pbinom(3, size = n, prob = p)
p_exact  # ~0.009048376

# aproksymacja Poissona
lambda <- n * p
p_pois <- ppois(3, lambda = lambda)
