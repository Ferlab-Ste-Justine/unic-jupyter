#!/usr/bin/env bash
set -e

Rscript -e 'install.packages("tidyverse", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("opalr", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("aws.s3", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("reticulate", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'