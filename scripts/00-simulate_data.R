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
                     "June", "July", "August", "September",
                     "October", "November", "December"),
                   num_rows, replace = TRUE),
    weekday = sample(c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
                       "Friday", "Saturday"), num_rows, replace = TRUE),
    hour = sample(sample(0:24, num_rows, replace = TRUE), ),
    location_type = sample(c("Apartment", "Bar / Restaurant",
                             "Convenience Stores",
                             "Bank And Other Financial Institutions",
                             "Universities / Colleges",
                             "Schools During Supervised Activity",
                             "Schools During Un-Supervised Activity",
                             "Single Home/House", "Private Property Structure",
                             "Hospital / Institutions / Medical Facilities",
                             "Homeless Shelter / Mission",
                             "Streets/Roads/Highways", "Parking Lots",
                             "TTC bus stop/shelter/loop",
                             "Go Station", "TTC Subway Station", "TTC Bus"),
                           num_rows, replace = TRUE),
    status = sample(c("Recovered", "Stolen", "Unknown"),
                    num_rows, replace = TRUE)
  )

# Add day part based on hour
simulated_data <- simulated_data %>%
  mutate(day_part = case_when(
    hour >= 6 & hour < 12 ~ "Morning",
    hour >= 12 & hour < 18 ~ "Afternoon",
    hour >= 18 & hour < 24 ~ "Evening",
    TRUE ~ "Overnight"  # Covers hours 0-6
  ))

# View the first few rows of the dataset
head(simulated_data)
