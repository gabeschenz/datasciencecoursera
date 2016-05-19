pollutantmean <- function(directory = "./specdata", pollutant, id = 1:332) {
  pollutant_measurements <- numeric()
  for(monitor in id) {
    data_file <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep="")
    pollutant_data <- read.csv(data_file)
    if (pollutant == "sulfate") {
      pollutant_measurements <- c(pollutant_measurements, pollutant_data$sulfate)  
    } else {
      pollutant_measurements <- c(pollutant_measurements, pollutant_data$nitrate)
    }
  }
  mean(pollutant_measurements, na.rm = TRUE)
}

## Tests
pollutantmean("./specdata", "sulfate", 1:10)
# ## [1] 4.064
 pollutantmean("./specdata", "nitrate", 70:72)
# ## [1] 1.706
# pollutantmean("./specdata", "nitrate", 23)
# ## [1] 1.281
# pollutantmean("specdata", "sulfate", 1:10)
# pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
