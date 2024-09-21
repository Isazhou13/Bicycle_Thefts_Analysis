#### Preamble ####
# Purpose: Cleans the raw data on bicycle thefts downloaded from OpenDataToronto
# Author: Xuanle Zhou
# Date: 21 September 2024 
# Contact: isabella.zhou@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Select specific columns and then drop rows with missing values
cleaned_data <- raw_data %>%
  select(OCC_YEAR, OCC_MONTH, OCC_DOW, PREMISES_TYPE, BIKE_COST, STATUS) %>%
  drop_na()

#Rename column name
cleaned_data <- cleaned_data %>%
  rename(
    `Year Offence Occurred` = `OCC_YEAR`,
    `Month Offence Occurred` = `OCC_MONTH`,
    `Day of the Week Offence Occurred` = `OCC_DOW`,
    `Premises Type of Offence` = `PREMISES_TYPE` ,
    `Cost of Bicycle` = `BIKE_COST`, 
    `Status of Bicycle` = `STATUS`
  )

# For Status of Bicycle column, capitalize the first letter and make the rest letters in lowercase
capitalize_first <- function(x) {
  return(toupper(substring(x, 1, 1)) %>% paste0(tolower(substring(x, 2))))
}
cleaned_data <- cleaned_data %>%
  mutate(`Status of Bicycle` = sapply(`Status of Bicycle`, capitalize_first))

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
