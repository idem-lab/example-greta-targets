
# greta-target-example

<!-- badges: start -->
<!-- badges: end -->

The goal of greta-target-example is to demonstrate how to use targets with greta.

This is a proof of concept and testing ground.

# How greta fails with targets

You might have seen this error before in targets:

```
Error in eval(ei, envir) : 
  Unable to access object (object is from previous session and is now invalid)
Called from: py_call_impl(callable, call_args$unnamed, call_args$named)
```

This is due to a detail in how greta works under the hood with python.

It happens if you create a model in one R session and then try and use it in 
another R session.

# What you need to add to make greta work with targets

To help fix this, you need to run some special code that essentially wakes up
the sleeping python objects that greta created in the previous session.

We call this `greta_awaken_model`, and it looks like this:

```r
greta_awaken_model <- function(model){
  dag <- model$dag
  dag$define_tf_trace_values_batch()
  dag$define_tf_log_prob_function()
}
```

An example usage of this would be as follows:

```r
# read in a greta model from another R session
m <- readr::read_rds("outputs/m.rds")
greta_awaken_model(m)
draws <- mcmc(m, )
```

An example pipeline with targets and greta can be seen in the `_targets.R` file
of this repo, as well as [here](https://github.com/idem-lab/targets-pkg-greta/blob/main/_targets.R).

