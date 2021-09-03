#' Install workshop solutions
#'
#' `install_solutions()` will download the solutions to the exercises for the workshop
#' Causal Inference in R on your computer. Then, it will open a new RStudio
#' Project containing the files you'll need.
#'
#' @param destdir The path on your computer where you would like the workshop
#'   installed. By default, this will install somewhere conspicuous, like your
#'   desktop, although you can tell `install_solutions()` exactly where you want
#'   it to download.
#'
#' @export
install_solutions <- function(destdir = getOption("usethis.destdir")) {
  usethis::use_course(
    "malcolmbarrett/causal_inference_r_workshop_solutions",
    destdir = destdir
  )
}
