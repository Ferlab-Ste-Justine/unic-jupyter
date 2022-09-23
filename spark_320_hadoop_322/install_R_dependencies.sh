#!/usr/bin/env bash
set -e

Rscript -e 'install.packages("vctrs", version = "0.4.1", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("dplyr", version = "1.0.9", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("tidyverse", version = "1.3.2", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("opalr", version = "3.1.1", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("aws.s3", version = "0.3.21", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("reticulate", version = "1.22", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("ggthemes", version = "4.2.4", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("plotly", version = "4.10.0", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("sparklyr", version = "1.7.8", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("pbapply", version = "1.5", lib = "/usr/local/spark-3.2.0-bin-hadoop3.2/R/lib", repos = "http://cran.us.r-project.org")'
