library(here)
library(readr)
source(here("r-script-only/01-just-define-model.R"))

m <- read_rds("r-script-only/m.rds")
m

source(here("r-script-only/02-just-fit-mcmc.R"))
source(here("r-script-only/03-just-plot-output.R"))
