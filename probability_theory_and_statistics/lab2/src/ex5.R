library(boot)
data("acme")

# Kwantyle rzędu 0.1, 0.3 i 0.9 dla acme$market
quantile(acme$market, probs = c(0.1, 0.3, 0.9))
