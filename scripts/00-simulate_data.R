#### Preamble ####
# Purpose: Simulates bicycle thefts to explore what plausible values might appear in the dataset.
# Author: Xuanle Zhou 
# Date: 21 September 2024 
# Contact: isabella.zhou@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)
library(dplyr)

# For reproducibility
set.seed(24) 

# Set parameters for the simulation
num_rows <- 500  # Number of rows in the dataset

simulated_data <- 
  tibble(
    year = sample(2022:2023, num_rows, replace = TRUE),
    month = sample(c("January", "February", "March", "April", "May",
                     "June", "July","August", "September", "October", "November", "December"), num_rows, replace = TRUE),
    weekday = sample(c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
                       "Friday", "Saturday"), num_rows, replace = TRUE),
    premises_type = sample(c("Apartment", "Commercial", "Educational", "House", "Other",
                             "Outside", "Transit"), num_rows, replace = TRUE),
    cost = sample(1:10000, num_rows, replace = TRUE),
    status = sample(c("Recovered", "Stolen", "Unknown"), num_rows, replace = TRUE)
  )

# View the first few rows of the dataset
head(simulated_data)





