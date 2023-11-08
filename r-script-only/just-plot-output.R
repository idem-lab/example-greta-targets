library(greta)

m <- readr::read_rds("r-script-only/m.rds")
draws <- readr::read_rds("r-script-only/draws.rds")

petal_length_plot <- seq(min(iris$Petal.Length),
                         max(iris$Petal.Length),
                         length.out = 100)

mu_plot <- alpha + petal_length_plot * beta

mu_plot_draws <- calculate(mu_plot, values = draws)
mu_est <- colMeans(mu_plot_draws[[1]])
plot(mu_est ~ petal_length_plot, type = "n",
     ylim = range(mu_plot_draws[[1]]))
apply(mu_plot_draws[[1]], 1, lines,
      x = petal_length_plot, col = grey(0.8))
lines(mu_est ~ petal_length_plot, lwd = 2)
