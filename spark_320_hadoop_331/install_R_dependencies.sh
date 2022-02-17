#!/usr/bin/env bash
set -e

Rscript -e 'install.packages("tidyverse", lib = "/usr/local/spark-3.2.1-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
