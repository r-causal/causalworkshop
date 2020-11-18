#' Install workshop materials
#'
#' `install_course()` will install the workshop materials for the workshop
#' Causal Inference in R on your computer. Then, it will open a new RStudio
#' Project containing the files you'll need.
#'
#' @param path The path on your computer where you would like the workshop
#'   installed
#'
#' @export
install_workshop <- function(path = ".") {
  usethis::use_course(
    "LucyMcGowan/user2020-causal-inference",
    normalizePath(path)
  )
}
