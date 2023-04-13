

limnoSat <- read.csv('Data/limnoSat_westernUSA.csv')
limnoSatMetadata <- read.csv('Data/limnoSat_westernUSA_metadata.csv')

climate_data <- readRDS('Data/climate_data.RDS')
landcover_data <- readRDS('Data/landcover_data.RDS')

elev_data <- readRDS('Data/elev_data.RDS')
hydro_data <- readRDS('Data/hydro_data.RDS')
watershed_data <- readRDS('Data/watershed_data.RDS')


source('Data/LAGOSUS_zoneIDs.R')
