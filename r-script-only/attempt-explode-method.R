library(greta)

source("r-script-only/01-just-define-model.R")

m <- readr::read_rds("r-script-only/m.rds")

visible_arrays <- m$visible_greta_arrays
visible_array_names <- names(visible_arrays)
visible_array_names

library(purrr)
alpha
# not found

assign(visible_array_names[[1]], visible_arrays[[1]])
# alpha is found now
alpha

# try and repeat for all to demonstrate using in a list
# beta
assign(visible_array_names[[2]], visible_arrays[[2]])
beta

# mu
assign(visible_array_names[[3]], visible_arrays[[3]])
mu

# doesn't work
walk2(visible_array_names, visible_arrays, assign)
# mu_plot
mu_plot
# sigma
sigma

# instead try a for loop...
for(i in seq_len(length(visible_array_names))){
  assign(visible_array_names[[i]], visible_arrays[[i]])
}

visible_array_names
beta
mu
mu_plot
sigma

# this works

# can we wrap this in a function?
put_greta_arrays_into_env <- function(m){
  
  visible_arrays <- m$visible_greta_arrays
  visible_array_names <- names(visible_arrays)
  
  
  # instead try a for loop...
  for(i in seq_len(length(visible_array_names))){
    assign(
      x = visible_array_names[[i]], 
      value = visible_arrays[[i]],
      envir = globalenv())
  }
}

rstudioapi::restartSession()

library(greta)
m <- readr::read_rds("r-script-only/m.rds")
put_greta_arrays_into_env(m)
alpha

draws <- mcmc(m, n_samples = 10, chains = 1)

# still run into issues because the tensorflow object doesn't persist across
# sessions