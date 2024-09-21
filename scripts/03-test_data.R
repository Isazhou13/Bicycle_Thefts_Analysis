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

# Test1: Check if the dataset has no missing values in important columns
test_that("No missing values in critical columns", {
  expect_equal(sum(is.na(cleaned_data$`Year Offence Occurred`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Month Offence Occurred`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Day of the Week Offence Occurred`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Premises Type of Offence`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Cost of Bicycle`)), 0)
  expect_equal(sum(is.na(cleaned_data$`Status of Bicycle`)), 0)
})

# Test2: Check if specific columns are of the correct type
test_that("Column types are correct", {
  expect_is(cleaned_data$`Year Offence Occurred`, "numeric")
  expect_is(cleaned_data$`Month Offence Occurred`, "character")
  expect_is(cleaned_data$`Day of the Week Offence Occurred`, "character")
  expect_is(cleaned_data$`Premises Type of Offence`, "character")
  expect_is(cleaned_data$`Cost of Bicycle`, "numeric")
  expect_is(cleaned_data$`Status of Bicycle`, "character")  
})

#### Test3: Check for duplicates ####
test_that("No duplicate rows in cleaned data", {
  expect_false(any(duplicated(cleaned_data)), info = "There are duplicate rows in the dataset.")
})

#### Test4: Check columns are in expected values ####
expected_months <- c("January", "February", "March", "April", "May", "June", 
                     "July", "August", "September", "October", "November", "December")
test_that("Month Offence Occurred contains expected values", {
  unique_months <- unique(cleaned_data$`Month Offence Occurred`)
  expect_setequal(unique_months, expected_months)
})