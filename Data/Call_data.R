# Script to call libraries and data ####

library(tidyerse)




climate_data <- readRDS('Data/climate_data.RDS')  |>
  filter(climate_year >= 1990)
landcover_data <- readRDS('Data/landcover_data.RDS')
elev_data <- readRDS('Data/elev_data.RDS')
hydro_data <- readRDS('Data/hydro_data.RDS')
watershed_data <- readRDS('Data/watershed_data.RDS')
zoneids_data <- readRDS('Data/zoneids_data.RDS')







