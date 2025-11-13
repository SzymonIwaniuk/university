# Zadanie 5
# alpha - liczba wyprodukowanych części w zakładzie A_i
# w - prawdopodobieństwo, że część z zakładu A_i jest wadliwa
alpha <- c(20000, 15000, 25000)
w <- c(0.003, 0.002, 0.004)

# prawdopodobieństwa wyboru zakładu:
P_A <- alpha / sum(alpha)

# całkowite prawdopodobieństwo wady:
P_B <- sum(P_A * w)

# prawdopodobieństwo, że wada pochodzi z A_i:
P_A_given_B <- (P_A * w) / P_B
names(P_A_given_B) <- c("A1", "A2", "A3")
P_A_given_B

