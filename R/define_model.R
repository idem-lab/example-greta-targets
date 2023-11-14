#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author Nicholas Tierney
#' @export
define_model <- function(garrays) {

  m <- model(
    garrays$alpha, 
    garrays$beta, 
    garrays$sigma
    )
  
  m

}
