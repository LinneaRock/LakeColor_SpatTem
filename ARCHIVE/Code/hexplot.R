#Not sure you need all of these but I'm afraid to delete any of them 
library(sf)
library(hexbin)
library(raster)
library(dplyr)
library(terra)
library(ggplot2)
library(tidyterra)

# Read shapefiles (50km hexagons)
shapefile50 <- terra::vect("conus_hex/conus_hex_50km.shp")
#Read in dataset with trends for the entire study period, average color over the study period
point_data <- readRDS("2024-08-02_lakecolor_climate_landcover_trends.rds")#read.csv("average_DWL.csv")


# This function does all the intermediate steps between the data and shapefile to render the dataframe used to make the figures
### Shapefile: The hexagon shapefile you want to use (I made 50km, 100km, 200km, and 300km)
### Point_data: The actual lake data with corresponding coordinates
merge.points.hex <- function(shapefile, point_data) {
  #Add a column of ones for the sum function later
  point_data["count"] <- 1
  #Subsets the point_data for just count and lat/long
  sum_data <- point_data %>% 
    select(count, lake_lat_decdeg, lake_lon_decdeg)
  
  #Subsets point data for avg_dwl_site, lm_slope_color, and lat/long
  point_data <- point_data %>% 
    select(avg_dwl_site, lm_slope_color, lake_lat_decdeg, lake_lon_decdeg)
  
  #Turns point_data into a Spatvector object which makes it compatible with terra functions 
  ###Geom = c(lat/long) defines the geometry of the spatial object
  point_data <- vect(point_data, geom = c("lake_lon_decdeg", "lake_lat_decdeg"))
  sum_data <- vect(sum_data, geom = c("lake_lon_decdeg", "lake_lat_decdeg"))
  
  #point_data has not CRS (Coordinate Reference System), this assigns it the standard dec/deg system
  crs(point_data) <- "+proj=longlat +datum=WGS84"
  crs(sum_data) <- "+proj=longlat +datum=WGS84"
  
  #The shapefile is in meters but the point_data is in dec/deg. This projects the dec/deg points to meters so it's compatible
  point_data <- project(point_data, crs(shapefile))
  sum_data <- project(sum_data, crs(shapefile))
  
  #Zonal function takes the shapefile of hexagons and determines which points are within each zone (and gives each zone an ID)
  #Functions include mean and sum within each polygon (hexagons in this case)
  zones_mean <- zonal(point_data, shapefile, mean)
  zones_sum <- zonal(sum_data, shapefile, sum)
  
  #This is stupid
  #The zonal function does not return geometry(coordinates), so there's no way to cross reference or plot spatially. So...
  
  #Centroids extracts the center point of each hexagon in the shapefile
  centroid_geometry <- centroids(shapefile)
  #Geom turns the list of centroid points into a list of coordinates
  geom_centroid <- geom(centroid_geometry)
  #Turns the list into a dataframe with an X and Y column
  geom_centroid <- as.data.frame(geom_centroid)
  #Subsets for just coordinates
  geom_centroid <- geom_centroid %>% 
    select(geom, x, y)
  
  #This is the same process but for the shapefiles geometry (returns each intersection point of each hexagon, which will help with plotting)
  geom_shapefile <- geom(shapefile)
  geom_shapefile <- as.data.frame(geom_shapefile)
  geom_shapefile <- geom_shapefile %>% 
    select(geom, x, y)
  
  # Merge original polygon geometry with mean values for each hexagon
  #Columns zone and geom are the same for their respective dataframes so we merge by both using by.x and by.y
  mean_points <- merge(zones_mean, geom_centroid, by.x = "zone", by.y = "geom", all = TRUE)
  #Do the same for sum values for each hexagon
  sum_points <- merge(zones_sum, geom_centroid, by.x = "zone", by.y = "geom", all = TRUE)
  #First, merge mean_points and geom_shapefile to get corresponding coordinates for each point
  all <- merge(mean_points, geom_shapefile, by.x = "zone", by.y = "geom", all = TRUE)
  #Second, merge the new dataframe with sum_points so all values are in the same dataframe
  all <- merge(all, sum_points, by.x = "zone", by.y = "zone", all = TRUE)
  
  #Finally, subset the final dataframe for values of interest 
  ### avg_dwl_year.x is actually avg_dwl_year whereas avg_dwl_year.y is the sum value 
  all <- all %>% 
    select(zone, avg_dwl_site, lm_slope_color, count, x.y, y.y) %>% 
    rename(avg_dwl_site = avg_dwl_site, lakeCount = count, x = x.y, y = y.y)
  
  return(all)
}

#Call the function for each hexagon size 

df_50 <- merge.points.hex(shapefile50, point_data)

#Custom color palette for the corresponding dwl values
avg_cols <- tibble(
  ymin = c(470,475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583),
  ymax = c(475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583,590),
  color = c(
    "#2158BC", "#316DC5", "#327CBB", "#4B80A0", "#568F96", "#6D9298", "#698C86",
    "#759E72", "#7BA654", "#7DAE38", "#94B660","#94B660", "#A5BC76", "#AAB86D",
    "#ADB55F", "#A8A965", "#AE9F5C", "#B3A053", "#AF8A44", "#A46905", "#9F4D04")
)

slope_cols <- tibble( color = c("#370B63", "#1D1591", "#1B2FA7","#2158BC","#3C88C7", "#58B1D2", "white",
                                "#7DAE38", "#579A2F", "#368627","#185B2A")) 

count_cols <- tibble(color = c("#93E5DC","#9AE6DF",  "#58B1D2","#3C88C7","#2158BC","#1B2FA7", "#1D1591","#370B63"))

#MEAN PLOTS
#50km
ggplot() +
  geom_spatvector(data = shapefile50) +
  geom_polygon(data = df_50, aes(x = x, y = y, group = zone, fill = avg_dwl_site), na.rm = FALSE) +
  scale_fill_gradientn(colors = avg_cols$color, limits = c(470, 590), na.value = "grey", guide = "none") +
  theme_void()

#SLOPE PLOTS
#50km
ggplot() +
  geom_spatvector(data = shapefile50) +
  geom_polygon(data = df_50, aes(x = x, y = y, group = zone, fill = lm_slope_color), na.rm = FALSE)  +
  scale_fill_gradientn(colors = slope_cols$color, limits = c(-3, 2.201695), na.value = "grey30") +
  theme_void()
  
#SUM PLOT
#50km
ggplot() +
  geom_spatvector(data = shapefile50) +
  geom_polygon(data = df_50, aes(x = x, y = y, group = zone, fill = lakeCount), na.rm = FALSE) +
  scale_fill_gradientn(colors = count_cols$color, limits = c(1, 669), na.value = "white") +
  theme_void()




