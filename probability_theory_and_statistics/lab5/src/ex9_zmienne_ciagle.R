# P(-1 <= X <= 2) dla n=3
# Obliczamy P(X <= 2) - P(X <= -1)
prob <- pt(2, df = 3) - pt(-1, df = 3)

print(prob)
