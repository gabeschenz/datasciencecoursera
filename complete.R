complete <- function(directory = "./specdata", id = 1:332) {
  # complete_measurements <- 0
  # case_number <- 1
  # print('##      id nobs')
  mydata = data.frame(id = numeric(length(id)), nobs = numeric(length(id)))
  for(i in 1:length(id)) {
    data_file <- paste(directory, "/", sprintf("%03d", id[i]), ".csv", sep="")
    pollutant_data <- read.csv(data_file)
    nobs <- nrow(pollutant_data[complete.cases(pollutant_data),])
    mydata$id[i] <- id[i]
    mydata$nobs[i] <- nobs
    # print(paste('##'
    #             , sprintf("%3d", case_number)
    #             , sprintf("%3d", monitor)
    #             , sprintf("%4d", nobs)
    #             , sep=" "))
    # case_number <- case_number + 1
  }
  # print(mydata)
  mydata
}


# source("complete.R")
# complete("specdata", 1)
##   id nobs
## 1  1  117
# complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
# complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
# complete("specdata", 3)
##   id nobs
## 1  3  243
# cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
# print(cc$nobs)

# cc <- complete("specdata", 54)
# print(cc$nobs)

# set.seed(42)
# cc <- complete("specdata", 332:1)
# use <- sample(332, 10)
# print(cc[use, "nobs"])
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])