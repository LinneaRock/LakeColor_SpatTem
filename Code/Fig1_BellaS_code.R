##      code for figure 1      ##

library(tidyverse)
library(maps)
library(ggplot2)
library(sf)

setwd("C:/Users/sadle/OneDrive/Documents/PhD/LakeColor_SpatTem")
data <-readRDS("2024-08-29_lakecolor_climate_landcover_trends.rds")

#color for manually created legend
bg.fui = tibble(
  ymin = c(470,475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583),
  ymax = c(475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583,590),
  color = c(
    "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86", 
    "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
    "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")
)

bg.fui<-as.data.frame(bg.fui)

#create column assigning colors to range of dWL values
data <- data %>% 
  mutate(col_hex = case_when(avg_dwl_site <= bg.fui[1,1] & avg_dwl_site <bg.fui[1,2] ~bg.fui[1,3],
                             avg_dwl_site <=bg.fui[2,1] & avg_dwl_site <bg.fui[2,2] ~bg.fui[2,3],
                             avg_dwl_site <=bg.fui[3,1] & avg_dwl_site <bg.fui[3,2] ~bg.fui[3,3]   , 
                             avg_dwl_site <=bg.fui[4,1] & avg_dwl_site <bg.fui[4,2] ~bg.fui[4,3]   , 
                             avg_dwl_site <=bg.fui[5,1] & avg_dwl_site <bg.fui[5,2] ~bg.fui[5,3]   , 
                             avg_dwl_site <=bg.fui[6,1] & avg_dwl_site <bg.fui[6,2] ~bg.fui[6,3]   , 
                             avg_dwl_site <=bg.fui[7,1] & avg_dwl_site <bg.fui[7,2] ~bg.fui[7,3]   , 
                             avg_dwl_site <=bg.fui[8,1] & avg_dwl_site <bg.fui[8,2] ~bg.fui[8,3]   , 
                             avg_dwl_site <=bg.fui[9,1] & avg_dwl_site <bg.fui[9,2] ~bg.fui[9,3]   , 
                             avg_dwl_site <=bg.fui[10,1] & avg_dwl_site <bg.fui[10,2] ~bg.fui[10,3]   , 
                             avg_dwl_site <=bg.fui[11,1] & avg_dwl_site <bg.fui[11,2] ~bg.fui[11,3]   , 
                             avg_dwl_site <=bg.fui[12,1] & avg_dwl_site <bg.fui[12,2] ~bg.fui[12,3]   , 
                             avg_dwl_site <=bg.fui[13,1] & avg_dwl_site <bg.fui[13,2] ~bg.fui[13,3]   , 
                             avg_dwl_site <=bg.fui[14,1] & avg_dwl_site <bg.fui[14,2] ~bg.fui[14,3]   , 
                             avg_dwl_site <=bg.fui[15,1] & avg_dwl_site <bg.fui[15,2] ~bg.fui[15,3]   , 
                             avg_dwl_site <=bg.fui[16,1] & avg_dwl_site <bg.fui[16,2] ~bg.fui[16,3]   , 
                             avg_dwl_site <=bg.fui[17,1] & avg_dwl_site <bg.fui[17,2] ~bg.fui[17,3]   , 
                             avg_dwl_site <=bg.fui[18,1] & avg_dwl_site <bg.fui[18,2] ~bg.fui[18,3]   , 
                             avg_dwl_site <=bg.fui[19,1] & avg_dwl_site <bg.fui[19,2] ~bg.fui[19,3]   , 
                             avg_dwl_site <=bg.fui[20,1] & avg_dwl_site <bg.fui[20,2] ~bg.fui[20,3]   , 
                             avg_dwl_site <=bg.fui[21,1] & avg_dwl_site <bg.fui[21,2] ~bg.fui[21,3]   , 
                             T~"black"))  

#figure 1 (a)- dwl averaged across all years
states <- map_data("state")


fig1a<-ggplot(data = data) + 
  geom_point(data = data, aes(x = lake_lon_decdeg, y = lake_lat_decdeg), color = data$col_hex, size = .1) +  # Add points
  scale_fill_distiller( palette="Spectral", direction=1)+
  theme_void()+
  coord_fixed(1.3) +
  geom_polygon(data= states, aes(x = long, y = lat, group = group), fill="transparent",color = "black", linewidth=0.5)

ggsave("fig1a.png", fig1a, height=4.5, width=6.5, units='in', dpi=1200)

# another option for fig 1 with ecoregions
# This reads in the shapefiles for ecoregions 
regions.sf <- read_sf("Data/aggr_ecoregions_2015/Aggr_Ecoregions_2015.shp")|>
  # fix this dumbass typo
  mutate(WSA9_NAME = ifelse(WSA9_NAME == "Temporate Plains", "Temperate Plains", WSA9_NAME))
st_crs(regions.sf)
regions.sf <- st_transform(regions.sf, crs=4269)

# create sf object from data
data.sf <- st_as_sf(data,
                    coords = c('lake_lon_decdeg', 'lake_lat_decdeg'),
                    crs=4326)

albers_crs <- st_crs(5070)
# Transform to the Albers Equal Area projection
data.sf <- st_transform(data.sf, crs = albers_crs)

st_crs(regions.sf) == st_crs(data.sf)
ggplot() + 
  geom_sf(data = data.sf, aes(), color = data$col_hex, size = .1) +  # Add points
  scale_fill_distiller( palette="Spectral", direction=1)+
  theme_void()+
  geom_sf(data= regions.sf, aes(), fill="transparent",color = "black", linewidth=0.5)

ggsave('Figures/Figure1/ecoregion_lakes.png',height=4.5, width=6.5, units='in', dpi=1200)

#figure 1 (b)- histogram of dwl
cols<-as.data.frame(breaks_seq<-seq(470,600,by=5))
names(cols)<-"breaks"
cols<- cols %>%
  mutate( col_hex = case_when(breaks >=bg.fui[1,1] & breaks <bg.fui[1,2] ~ bg.fui[1,3],
                              breaks >=bg.fui[2,1] & breaks <bg.fui[2,2] ~bg.fui[2,3], 
                              breaks >=bg.fui[3,1] & breaks <bg.fui[3,2] ~bg.fui[3,3]   , 
                              breaks >=bg.fui[4,1] & breaks <bg.fui[4,2] ~bg.fui[4,3]   , 
                              breaks >=bg.fui[5,1] & breaks <bg.fui[5,2] ~bg.fui[5,3]   , 
                              breaks >=bg.fui[6,1] & breaks <bg.fui[6,2] ~bg.fui[6,3]   , 
                              breaks >=bg.fui[7,1] & breaks <bg.fui[7,2] ~bg.fui[7,3]   , 
                              breaks >=bg.fui[8,1] & breaks <bg.fui[8,2] ~bg.fui[8,3]   , 
                              breaks >=bg.fui[9,1] & breaks <bg.fui[9,2] ~bg.fui[9,3]   , 
                              breaks >=bg.fui[10,1] & breaks <bg.fui[10,2] ~bg.fui[10,3]   , 
                              breaks >=bg.fui[11,1] & breaks <bg.fui[11,2] ~bg.fui[11,3]   , 
                              breaks >=bg.fui[12,1] & breaks <bg.fui[12,2] ~bg.fui[12,3]   , 
                              breaks >=bg.fui[13,1] & breaks <bg.fui[13,2] ~bg.fui[13,3]   , 
                              breaks >=bg.fui[14,1] & breaks <bg.fui[14,2] ~bg.fui[14,3]   , 
                              breaks >=bg.fui[15,1] & breaks <bg.fui[15,2] ~bg.fui[15,3]   , 
                              breaks >=bg.fui[16,1] & breaks <bg.fui[16,2] ~bg.fui[16,3]   , 
                              breaks >=bg.fui[17,1] & breaks <bg.fui[17,2] ~bg.fui[17,3]   , 
                              breaks >=bg.fui[18,1] & breaks <bg.fui[18,2] ~bg.fui[18,3]   , 
                              breaks >=bg.fui[19,1] & breaks <bg.fui[19,2] ~bg.fui[19,3]   , 
                              breaks >=bg.fui[20,1] & breaks <bg.fui[20,2] ~bg.fui[20,3]   , 
                              breaks >=bg.fui[21,1] & breaks <=bg.fui[21,2] ~bg.fui[21,3] ,
                              T~"black"))

png("fig1b.png", height=4, width=5, units="in", res=1200)
par(mar=c(4,4,1,1))
hist(data$avg_dwl_site, ylab="Number of lakes", xlab="Dominant wavelength (nm)",
     breaks=cols$breaks, col = cols$col_hex, main="", ylim=c(0,8000), xlim=c(470,590))
abline(v=530, col="black", lty="dashed",lwd=2)
dev.off()

data %>% 
  filter(avg_dwl_site >= 530) %>% 
  nrow()
data %>% 
  filter(avg_dwl_site <= 530) %>% 
  nrow()

#calculate avg dwl for each ecoregion
data <-data %>% 
  mutate(ecoregion_name = case_when(epanutr_zoneid=="epanutr_1"~"Coastal Plains",
                                    epanutr_zoneid=="epanutr_2"~"Northern Appalachians",
                                    epanutr_zoneid=="epanutr_3"~"Northern Plains",
                                    epanutr_zoneid=="epanutr_4"~"Southern Appalachians",
                                    epanutr_zoneid=="epanutr_5"~"Southern Plains",
                                    epanutr_zoneid=="epanutr_6"~"Temperate Plains",
                                    epanutr_zoneid=="epanutr_7"~"Upper Midwest",
                                    epanutr_zoneid=="epanutr_8"~"Western Mountains",
                                    epanutr_zoneid=="epanutr_9"~"Xeric", T~"black"))

# summary table with the mean dwl and slope for each ecoregion
mean_dwl_slope <- data %>%
  group_by(ecoregion_name) %>%  
  summarise(mean_dwl = mean(avg_dwl_site, na.rm = TRUE),
            mean_slope = mean(lm_slope_color, na.rm = TRUE))  

View(mean_dwl_slope)


