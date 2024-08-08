
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Install the workshop materials for Causal Inference in R

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install causalworkshop from this repository with

``` r
install.packages("pak")
pak::pak("r-causal/causalworkshop")
```

Once you’ve installed the package, install the workshop with

``` r
causalworkshop::install_workshop()
```

By default, this package downloads the materials to a conspicuous place
like your Desktop. You can also tell `install_workshop()` exactly where
to put the materials:

``` r
causalworkshop::install_workshop("a/path/on/your/computer")
```
