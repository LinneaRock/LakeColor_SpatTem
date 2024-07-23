# mds/nmds

library(tidyverse)
library(cluster)

# always ctrl-alt-enter

# call most recent data
color_data <- read.csv('2024-04-25_lakecolor_climate_landcover_trends.csv')

# create distance matrix
env.dist.predcolor <- color_data |>
  select(lake_elevation_m, lake_waterarea_ha, ws_area_ha, avg_temp_degC, avg_annual_range_temp_degC, avg_ppt, range_ppt, avg_nlcd_wetland_pct, avg_nlcd_forest_pct, avg_nlcd_ag_pct, avg_nlcd_dev_pct, avg_nlcd_barren31_pct, avg_nlcd_grass71_pct, avg_nlcd_icesnow12_pct, avg_nlcd_shrub52_pct) |>
  as.data.frame()

rownames(env.dist.predcolor) <- color_data$lake_nhdid
env.dist.predcolor <- as.matrix(env.dist.predcolor) 

env.dist.predcolor <- daisy(scale(env.dist.predcolor), metric = 'gower') # “Gower's distance” is chosen by metric "gower" or automatically if some columns of x are not numeric. Also known as Gower's coefficient (1971), expressed as a dissimilarity, this implies that a particular standardisation will be applied to each variable, and the “distance” between two units is the sum of all the variable-specific distances


# put distance matrix through meta MDS via cmdscale from the stats package
set.seed(06261993)
env.predcolor_mds <- cmdscale(env.dist.predcolor, k=10, eig=TRUE)

