# P(1 <= X <= 1.5) dla F(k1=3, k2=1)
# Obliczamy P(X <= 1.5) - P(X <= 1)
prob <- pf(1.5, df1 = 3, df2 = 1) - pf(1, df1 = 3, df2 = 1)

print(prob)
