# format LAGOS datasets into 9 ecoregions 

library(tidyverse)

# 1. Note about landcover data ####

# call in data, we have epa nutrient ecoregions and huc12 watershed landcover data saved. There are 7 NLCD years of data for each region and watershed
landcover_data <- readRDS('LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/landcover_data.RDS') 

# here, I am breaking out landcover data from the ecoregions and saving it separately so we have it if we decide to use it
landcover_data_epanutr <- landcover_data |>
  filter(spatial_division == 'epanutr') |>
  rename(hu12_zoneid = zoneid) |>
  select(-spatial_division)
write_rds(landcover_data_epanutr, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/landcover_data_epanutr.RDS')

# here, I am breaking out huc12 data, which is likely more useful for our purposes, i.e., it will more tightly tie to individual lakes than the large regional data would. This is the data that will be included below
landcover_data_hu12 <- landcover_data |>
  filter(spatial_division != 'epanutr') |>
  rename(hu12_zoneid = zoneid) |>
  select(-spatial_division)


# 3. Call in all other data ####
elev_data <- readRDS('LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/elev_data.RDS')
hydro_data <- readRDS('LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/hydro_data.RDS')
watershed_data <- readRDS('LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/watershed_data.RDS')
zoneids_data <- readRDS('LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/zoneids_data.RDS')


# 4. Break data by EPA nutrient ecoregions ####
# I know a loop would have been more efficient 
# I am saving each dataset by EPA nutrient ecoregion. These datasets have all the LAGOS data EXCEPT climate, which is HUGE. I'll try to put these files on google drive so folks can individually call and bind datasets as needed :)

epanutr_1 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_1') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_1, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_1.RDS')


epanutr_2 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_2') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_2, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_2.RDS')

epanutr_3 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_3') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_3, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_3.RDS')

epanutr_4 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_4') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_4, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_4.RDS')

epanutr_5 <-  zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_5') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_5, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_5.RDS')

epanutr_6 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_6') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_6, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_6.RDS')

epanutr_7 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_7') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_7, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_7.RDS')

epanutr_8 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_8') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_8, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_8.RDS')

epanutr_9 <- zoneids_data |>
  filter(epanutr_zoneid == 'epanutr_9') |>
  left_join(elev_data) |>
  left_join(hydro_data) |>
  left_join(watershed_data) |>
  left_join(landcover_data_hu12)
write_rds(epanutr_9, 'LakeSR/1_DataPrep/1_DataDownloads/1_LAGOS/lake_data_epanutr_9.RDS')
