library(greta)

m <- readr::read_rds("r-script-only/m.rds")

draws <- mcmc(m, n_samples = 10, chains = 1)

readr::write_rds(draws, "r-script-only/draws.rds")
