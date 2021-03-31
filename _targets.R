## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(
  
  tar_target(m, define_model()),
  tar_target(model_draws, mcmc(m, n_samples = 100)),
  tar_render(plots, "doc/plots.Rmd")

# target = function_to_make(arg), ## drake style

# tar_target(target2, function_to_make2(arg)) ## targets style

)
