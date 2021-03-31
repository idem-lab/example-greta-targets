#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author Nicholas Tierney
#' @export
define_model <- function() {

  alpha <- normal(0, 1)
  beta <- normal(0, 1)
  sigma <- lognormal(1, 0.1)
  y <- as_data(iris$Petal.Width)
  mu <- alpha + iris$Petal.Length * beta
  distribution(y) <- normal(mu, sigma)
  m <- model(alpha, beta, sigma)
  
  m

}
