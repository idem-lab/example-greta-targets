
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



# What you need to add to make greta work with targets



# Getting started using tflow.

```
> library(tflow)
> use_tflow()
✓ Setting active project to '/Users/njtierney/github/njtierney/greta-dev/greta-target-example'
✓ Creating 'R/'
✓ Writing 'packages.R'
✓ Writing '_targets.R'
✓ Writing '.env'
```

Then create an Rmarkdown document that has some nice plots in it as well

```
> use_rmd("plots")
✓ Creating 'doc/'
✓ Writing 'doc/plots.Rmd'
```

See [tflow](https://github.com/milesmcbain/tflow) for more details.