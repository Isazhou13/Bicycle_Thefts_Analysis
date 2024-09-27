#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Xuanle Zhou
# Date: 27 September 2024
# Contact: isabella.zhou@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A


#### Workspace setup ####

library(opendatatoronto)
library(dplyr)
library(readr)

#the R Codes from OpenDataToronto provided for developers only downloads top 32,000 rows of observations, which is not sufficient for this analysis. Thus,read_csv was used to save the datasets.

#### Download data ####

data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/c7d34d9b-23d2-44fe-8b3b-cd82c8b38978/resource/55136dac-26b1-4028-b9f5-7c2344f94153/download/bicycle-thefts%20-%204326.csv")
write_csv(data, "data/raw_data/raw_data.csv")
