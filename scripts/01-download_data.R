#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Xuanle Zhou
# Date: 21 September 2024 
# Contact: isabella.zhou@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A


#### Workspace setup ####

library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("c7d34d9b-23d2-44fe-8b3b-cd82c8b38978")
package

# get all resources for this package
resources <- list_package_resources("c7d34d9b-23d2-44fe-8b3b-cd82c8b38978")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####

# change the_raw_data to whatever name you assigned when you downloaded it.
library(readr)
write_csv(data, "data/raw_data/raw_data.csv") 
