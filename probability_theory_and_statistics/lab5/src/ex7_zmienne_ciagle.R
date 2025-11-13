# P(5 <= X <= 10) dla n=3
# Obliczamy P(X <= 10) - P(X <= 5)
prob <- pchisq(10, df = 3) - pchisq(5, df = 3)

print(prob)
