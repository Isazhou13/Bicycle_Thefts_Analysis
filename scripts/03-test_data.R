#### Preamble ####
# Purpose: Tests for Cleaned Data to Prevent Errors and Ensure Data Integrity
# Author: Xuanle Zhou
# Date: 21 September 2024
# Contact: Xuanle Zhou
# License: MIT
# Pre-requisites: N/A
# Any other information needed? N/A

#### Workspace setup ####
library(dplyr)
library(readr)
library(testthat)

#### Load the cleaned data ####
library(here)
cleaned_data <- read_csv(here("data", "analysis_data", "analysis_data.csv"))

#### Test data #### 

# Test1: Check if the dataset has missing values in columns
test_that("No missing values in critical columns", {
  expect_equal(sum(is.na(cleaned_data$`Year`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Month`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Day of the Week`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Location Type`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Status`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Day Part`)), 0)
})

# Test2: Check if specific columns are of the correct type
test_that("Column types are correct", {
  expect_is(cleaned_data$`Year`, "numeric")
  expect_is(cleaned_data$`Month`, "character")
  expect_is(cleaned_data$`Day of the Week`, "character")
  expect_is(cleaned_data$`Location Type`, "character")
  expect_is(cleaned_data$`Status`, "character")  
  expect_is(cleaned_data$`Day Part`, "character")
})

#Test3: Check columns are in expected values #
expected_months <- c("January", "February", "March", "April", "May", "June", 
                     "July", "August", "September", "October", "November", "December")
test_that("Month Offence Occurred contains expected values", {
  unique_months <- unique(cleaned_data$`Month`)
  expect_setequal(unique_months, expected_months)
})

expected_weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
test_that("Month Offence Occurred contains expected values", {
  unique_weekday <- unique(cleaned_data$`Day of the Week`)
  expect_setequal(unique_weekday, expected_weekdays)
})

expected_status <- c("Stolen", "Recovered", "Unknown")
test_that("Status Offence Occurred contains expected values", {
  unique_status <- unique(cleaned_data$`Status`)
  expect_setequal(unique_status, expected_status)
})

expected_daypart <- c("Morning", "Afternoon", "Evening","Overnight")
test_that("Day Part Offence Occurred contains expected values", {
  unique_daypart <- unique(cleaned_data$`Day Part`)
  expect_setequal(unique_daypart, expected_daypart)
})