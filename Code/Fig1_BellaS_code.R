##      code for figure 1      ##

library(tidyverse)
library(maps)
library(ggplot2)

setwd("C:/Users/sadle/OneDrive/Documents/PhD/LakeColor_SpatTem")
data <-readRDS("2024-08-02_lakecolor_climate_landcover_trends.rds")

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
                             avg_dwl_site <=bg.fui[21,1] & avg_dwl_site <bg.fui[21,2] ~bg.fui[21,3] , T~"black"))  

#figure 1 (a)
states <- map_data("state")

fig1a<-ggplot(data = data) + 
  geom_point(data = data, aes(x = lake_lon_decdeg, y = lake_lat_decdeg), color = data$col_hex, size = .75) +  # Add points
  scale_fill_distiller( palette="Spectral", direction=1)+
  theme_void()+
  coord_fixed(1.3) +
  geom_polygon(data= states, aes(x = long, y = lat, group = group), fill="transparent",color = "black", linewidth=0.5)

ggsave("fig1a.png", fig1a, height=4.5, width=6.5, units='in', dpi=1200)




