
source('Data/Call_data.R')


# formatting dataset 

hydro2 <- hydro_data |>
  select(lagoslakeid, lake_waterarea_ha, lake_perimeter_m, lake_islandperimeter_m, lake_connectivity_class, lake_connectivity_permanent) |>
  mutate(lake_totalperimeter_m = lake_islandperimeter_m + lake_perimeter_m)

elev2 <- elev_data |>
  select(lagoslakeid, lake_elevation_m, lake_county)

limnoSat2 <- limnoSat |>
  select(-nhdplusv2_comid)

watershed2 <- watershed_data |>
  select(lagoslakeid, ws_area_ha, ws_lake_arearatio)

zoneid2 <- zoneIDs |>
  select(lagoslakeid, hu12_zoneid)


bigdata <- left_join(limnoSat, hydro2) |>
  left_join(elev2) |>
  left_join(watershed2) |>
  left_join(zoneid2)

bigdata2 <- bigdata |>
  filter(lake_waterarea_ha < 10)


length(unique(bigdata2$lagoslakeid))
