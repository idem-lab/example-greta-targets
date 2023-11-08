library(greta)
library(readr)
library(here)

m <- read_rds(here("r-script-only/m.rds"))

draws <- mcmc(m, n_samples = 10, chains = 1)

write_rds(draws, here("r-script-only/draws.rds"))
