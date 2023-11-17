## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
tar_source()

## tar_plan supports drake-style targets and also tar_target()
tar_plan(
  
  tar_target(garrays, create_arrays()),
  tar_target(m, define_model(garrays)),
  tar_target(draws, mcmc(m, n_samples = 50)),
  tar_render(plots, "doc/plots.Rmd")

  ) %>% 
  tarchetypes::tar_hook_before(
    hook = greta_awaken_model(m),
    # list the targets that use a greta model object
    names = c(draws, plots)
  )