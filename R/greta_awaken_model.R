#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param model
#' @return
#' @author njtierney
#' @export
greta_awaken_model <- function(model){
  dag <- model$dag
  dag$define_tf_trace_values_batch()
  dag$define_tf_log_prob_function()
}

read_greta <- function(path){
  greta_model <- readr::read_rds(path)
  greta_awaken_model(greta_model)
  greta_model
}