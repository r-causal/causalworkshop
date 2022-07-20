# sourced from https://www.andrewheiss.com/blog/2020/12/01/ipw-binary-continuous/
# our thanks to Andrew!
library(tidyverse)
library(scales)

# Make this randomness consistent
set.seed(1234)

# Simulate 1138 people (just for fun)
n_people <- 1138

net_data <- tibble(
  # Make an ID column (not necessary, but nice to have)
  id = 1:n_people,
  # Generate income variable: normal, 500 ± 300
  income = rnorm(n_people, mean = 500, sd = 75)
) %>%
  # Generate health variable: beta, centered around 70ish
  mutate(health_base = rbeta(n_people, shape1 = 7, shape2 = 4) * 100,
         # Health increases by 0.02 for every dollar in income
         health_income_effect = income * 0.02,
         # Make the final health score and add some noise
         health = health_base + health_income_effect + rnorm(n_people, mean = 0, sd = 3),
         # Rescale so it doesn't go above 100
         health = rescale(health, to = c(min(health), 100))) %>%
  # Generate net variable based on income, health, and random noise
  mutate(net_score = (0.5 * income) + (1.5 * health) + rnorm(n_people, mean = 0, sd = 15),
         # Scale net score down to 0.05 to 0.95 to create a probability of using a net
         net_probability = rescale(net_score, to = c(0.05, 0.95)),
         # Randomly generate a 0/1 variable using that probability
         net = rbinom(n_people, 1, net_probability)) %>%
  # Finally generate a malaria risk variable based on income, health, net use,
  # and random noise
  mutate(malaria_risk_base = rbeta(n_people, shape1 = 4, shape2 = 5) * 100,
         # Risk goes down by 10 when using a net. Because we rescale things,
         # though, we have to make the effect a lot bigger here so it scales
         # down to -10. Risk also decreases as health and income go up. I played
         # with these numbers until they created reasonable coefficients.
         malaria_effect = (-30 * net) + (-1.9 * health) + (-0.1 * income),
         # Make the final malaria risk score and add some noise
         malaria_risk = malaria_risk_base + malaria_effect + rnorm(n_people, 0, sd = 3),
         # Rescale so it doesn't go below 0,
         malaria_risk = rescale(malaria_risk, to = c(5, 70))) %>%
  select(-c(health_base, health_income_effect, net_score, net_probability,
            malaria_risk_base, malaria_effect))

usethis::use_data(net_data, overwrite = TRUE)
