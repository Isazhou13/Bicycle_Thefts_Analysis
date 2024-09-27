#### Preamble ####
# Purpose: Cleans the raw data on bicycle thefts downloaded from OpenDataToronto
# Author: Xuanle Zhou
# Date: 27 September 2024 
# Contact: isabella.zhou@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <- raw_data %>%
  mutate(LOCATION_TYPE = gsub("\\s*\\(.*?\\)", "", LOCATION_TYPE))


# Select specific columns and then drop rows with missing values
cleaned_data <- cleaned_data %>%
  select(OCC_YEAR, OCC_MONTH, OCC_DOW, OCC_HOUR,LOCATION_TYPE, STATUS) %>%
  filter(OCC_YEAR >= 2014 & OCC_YEAR <= 2023) %>%  
  drop_na()  # Remove rows with NA values


#Rename column name
cleaned_data <- cleaned_data %>%
  rename(
    `Year` = `OCC_YEAR`,
    `Month` = `OCC_MONTH`,
    `Day of the Week` = `OCC_DOW`,
    `Hour` = `OCC_HOUR`,
    `Location Type` = `LOCATION_TYPE`,
    `Status` = `STATUS`
  ) %>%
  mutate(
    `Day Part` = case_when(
      `Hour` >= 6 & `Hour` < 12 ~ "Morning",
      `Hour` >= 12 & `Hour` < 18 ~ "Afternoon",
      `Hour` >= 18 & `Hour` < 24 ~ "Evening",
      TRUE ~ "Overnight"  # Covers hours from 9 PM to 4 AM
    )
  )


# For Status of Bicycle column, capitalize the first letter and make the rest letters in lowercase
capitalize_first <- function(x) {
  return(toupper(substring(x, 1, 1)) %>% paste0(tolower(substring(x, 2))))
}
cleaned_data <- cleaned_data %>%
  mutate(`Status` = sapply(`Status`, capitalize_first))


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
