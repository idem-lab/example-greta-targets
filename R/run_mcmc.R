#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param m
#' @param n_samples
#' @return
#' @author njtierney
#' @export
run_mcmc <- function(m, n_samples = 100) {

  greta_awaken_model(m)
  samples <- mcmc(m, n_samples = n_samples)
  samples

}
