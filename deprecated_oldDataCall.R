
# masterDF <- read.csv('Data/masterDF.csv')

# Below code is how we created masterDF.RDS :)
# if you want climate data, uncomment below to read it into your environment and rename zoneid to be hu12_zoneid




# limnoSat <- read.csv('Data/limnoSat_westernUSA.csv')
# limnoSatMetadata <- read.csv('Data/limnoSat_westernUSA_metadata.csv')
# 
# climate_data <- readRDS('Data/climate_data.RDS')
# landcover_data <- readRDS('Data/landcover_data.RDS')
# 
# elev_data <- readRDS('Data/elev_data.RDS')
# hydro_data <- readRDS('Data/hydro_data.RDS')
# watershed_data <- readRDS('Data/watershed_data.RDS')
# 
# 
# source('Data/LAGOSUS_zoneIDs.R')
# 
# 
# # formatting dataset 
# 
# hydro2 <- hydro_data |>
#   select(lagoslakeid, lake_waterarea_ha, lake_perimeter_m, lake_islandperimeter_m, lake_connectivity_class, lake_connectivity_permanent) |>
#   mutate(lake_totalperimeter_m = lake_islandperimeter_m + lake_perimeter_m)
# 
# elev2 <- elev_data |>
#   select(lagoslakeid, lake_elevation_m, lake_county)
# 
# limnoSat2 <- limnoSat |>
#   select(-nhdplusv2_comid)
# 
# watershed2 <- watershed_data |>
#   select(lagoslakeid, ws_area_ha, ws_lake_arearatio)
# 
# zoneid2 <- zoneIDs |>
#   select(lagoslakeid, hu12_zoneid)
# 
# 
# bigdata <- left_join(limnoSat, hydro2) |>
#   left_join(elev2) |>
#   left_join(watershed2) |>
#   left_join(zoneid2)
# 
# bigdata2 <- bigdata |>
#   filter(lake_waterarea_ha < 10)
# 
# 
# length(unique(bigdata2$lagoslakeid))
# 

# saveRDS(bigdata2, 'Data/masterDF.RDS')
# 
# 


#climate2 <- climate_data |>
#   rename(hu12_zoneid = zoneid) |>
#   select(-spatial_division)
# 



