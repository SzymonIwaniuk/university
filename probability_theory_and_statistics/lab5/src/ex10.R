multinomial_cdf <- function(x, n, p) {
  r <- length(p)
  library(gtools)
  
  # Generujemy wszystkie kombinacje 0..x_i dla każdej zmiennej
  all_combs <- expand.grid(lapply(x, function(xi) 0:xi))
  
  # Zostawiamy tylko kombinacje, które sumują się do n
  all_combs <- all_combs[rowSums(all_combs) == n, ]
  
  # Sumujemy prawdopodobieństwa
  sum(apply(all_combs, 1, function(row) dmultinom(row, size = n, prob = p)))
}

multinomial_cdf(c(2,1,2), n=5, p=c(0.3,0.2,0.5))

