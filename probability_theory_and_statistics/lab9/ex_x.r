library(markovchain)
set.seed(123)

rainfall_data <- rgamma(n = 1000, shape = 2, scale = 5)
discrete_states <- cut(rainfall_data, breaks = 10, labels = paste0("State_", 1:10))
head(discrete_states)

mc_rainfall <- markovchainFit(data = discrete_states)

print(mc_rainfall$estimate)
plot(mc_rainfall$estimate)