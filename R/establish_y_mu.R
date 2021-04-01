#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author Nicholas Tierney
#' @export
establish_y_mu <- function(alpha, beta, sigma) {

  y <- as_data(iris$Petal.Width)
  mu <- alpha + iris$Petal.Length * beta
  distribution(y) <- normal(mu, sigma)
  
  return(list(mu = mu, 
              y = y))

}
