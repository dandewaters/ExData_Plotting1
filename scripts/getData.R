## =========================================================================
## Filename: getData.R
# Author: Daniel DeWaters
# Date Created: 9/4/2019
# Description: Downloads, unzips, and tidy's the household power consumption 
#              dataset. Run this script before running the plotting scripts.
## =========================================================================

library(lubridate)
library(tidyr)
library(dplyr)



## Download/Read in data
data_file_name <- "./data/exdata_data_household_power_consumption.zip"
unzipped_file_path <- "./data/household_power_consumption.txt"
if(!file.exists(data_file_name)){
  data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(data_url, destfile=data_file_name)
  unzip(data_file_name, exdir="./data", overwrite=TRUE)
}
unzipped_data <- read.delim(unzipped_file_path, header=TRUE, sep=";", na.strings="?", fill=TRUE, stringsAsFactors=FALSE)

# Combines the date and time columns to make plotting over the 2 day period easier
data <-
  unzipped_data %>%
  unite(col=DateTime, c("Date", "Time"), sep=" ", remove=TRUE) %>%
  mutate(DateTime = dmy_hms(DateTime))

# Grab rows that are from the correct date
day_1 <- ymd("2007-02-01")
day_2 <- ymd("2007-02-02")
relevant_data <- filter(data, as.Date(DateTime)==day_1|as.Date(DateTime)==day_2)
