# liczebności grup
groups <- c(28, 23, 22, 27)
N <- sum(groups)
k <- 5 # liczba losowań

library(combinat)

# funkcja do liczenia prawdopodobieństwa, że dane grupy nie zostaną wylosowane
prob_missing <- function(miss_groups) {
  remaining <- N - sum(groups[miss_groups])
  if(remaining < k) return(0)
  prod(remaining:(remaining - k + 1)) / prod(N:(N - k + 1))
}

# włączenia i wyłączenia
library(gtools)
r <- length(groups)
P <- 0
for(m in 1:r){
  combs <- combinations(r, m)
  sgn <- (-1)^(m+1)
  for(i in 1:nrow(combs)){
    P <- P + sgn * prob_missing(combs[i,])
  }
}

P_all_groups <- P
P_all_groups
print(P_all_groups)
