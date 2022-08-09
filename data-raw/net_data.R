# sourced from https://evalsp21.classes.andrewheiss.com/example/matching-ipw/
# The true average treatment effect (ATE) is -10
# our thanks to Andrew!
library(readr)
net_data <- read_csv("data-raw/mosquito_nets.csv")
usethis::use_data(net_data, overwrite = TRUE)
