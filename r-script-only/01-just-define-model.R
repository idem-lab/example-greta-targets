library(greta)

alpha <- normal(0, 1)
beta <- normal(0, 1)
sigma <- lognormal(1, 0.1)
y <- as_data(iris$Petal.Width)
mu <- alpha + iris$Petal.Length * beta
distribution(y) <- normal(mu, sigma)
m <- model(alpha, beta, sigma)

m

readr::write_rds(x = m, file = "r-script-only/m.rds")