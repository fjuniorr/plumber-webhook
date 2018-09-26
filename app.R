#!/usr/bin/env Rscript

library(plumber)

r <- plumb("code/R/routers.R")

r$run(host = "0.0.0.0", port = 80)
