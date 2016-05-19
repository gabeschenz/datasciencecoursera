corr <- function(directory = "./specdata", threshold = 0) {
  complete_measurements <- 0
  id <- 1:332
  correlations <- numeric(0)
  for(monitor in id) {
    data_file <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep="")
    pollutant_data <- read.csv(data_file)
    pollutant_data <- pollutant_data[complete.cases(pollutant_data),]
    if(nrow(pollutant_data) < threshold) {
      next()
    }
    if (exists("corr_data")) {
      corr_data <- c(corr_data, pollutant_data)
    } else {
      corr_data <- pollutant_data
    }
    correlations <- c(correlations, cor(corr_data$sulfate, corr_data$nitrate))
  }
  correlations
}


# source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
cr <- corr("specdata", 400)
head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
cr <- corr("specdata", 5000)
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
length(cr)
## [1] 0
cr <- corr("specdata")
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
length(cr)
## [1] 323
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))