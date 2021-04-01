## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(
  
  tar_target(alpha, normal(0, 1)),
  tar_target(beta, normal(0, 1)),
  tar_target(sigma, lognormal(1, 0.1)),
  tar_target(y_mu_distr, establish_y_mu(alpha, beta, sigma)),
  tar_target(m, model(alpha, beta, sigma)),
  
  tar_target(model_draws, mcmc(m, n_samples = 100)),
  tar_render(plots, "doc/plots.Rmd")

# target = function_to_make(arg), ## drake style

# tar_target(target2, function_to_make2(arg)) ## targets style

)
