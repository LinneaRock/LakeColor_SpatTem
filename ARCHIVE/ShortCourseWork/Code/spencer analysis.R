masterDF <- read.csv('Data/masterDF.csv')

library(tidyverse)
library(ggridges)
library(viridis)
library(ggeffects)
library(lme4)
library(sf)
library(mapview)
library(lattice)
library(leafpop)
library(RColorBrewer)




ggplot(masterDF, mapping = aes(x = lake_waterarea_ha , y = dWL)) +
  geom_point(size = 3, shape = 20, alpha = 0.5)




ggplot(masterDF, aes(x = lake_waterarea_ha, y = lake_centroidstate)) +
  geom_density_ridges(scale = 1, alpha = 0.5, rel_min_height = 0.01) 


ggplot(masterDF, aes(x = dWL, y = lake_centroidstate)) +
  geom_density_ridges( scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  geom_rect(data = bg.fui, 
            aes(xmin = ymin, xmax = ymax, ymin = -5, ymax = 100, fill = color)) + 
  scale_fill_identity()


bg.fui = tibble(
  ymin = c(470,475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583),
  ymax = c(475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583,590),
  color = c(
    "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86", 
    "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
    "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")
)


ggplot() +
  geom_rect(data = bg.fui, 
            aes(xmin = ymin, xmax = ymax, ymin = -Inf, ymax = Inf, fill = color)) +
  geom_density_ridges(data=masterDF,  aes(x = dWL, y = lake_centroidstate),
                      scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  scale_fill_identity() +
  scale_x_continuous(expand = c(0, 0))



ggplot() +
  geom_rect(data = bg.fui, 
            aes(xmin = ymin, xmax = ymax, ymin = -Inf, ymax = Inf, fill = color)) +
  geom_density_ridges(data=masterDF,  aes(x = dWL, y = lake_connectivity_class),
                      scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  scale_fill_identity() +
  scale_x_continuous(expand = c(0, 0))  +
  facet_wrap(~lake_centroidstate)




ggplot() +
  geom_rect(data = bg.fui, 
            aes(xmin = ymin, xmax = ymax, ymin = -Inf, ymax = Inf, fill = color)) +
  geom_density_ridges(data=masterDF,  aes(x = lake_lat_decdeg, y = as.factor(year), fill = "black"),
                      scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  scale_fill_identity() +
  scale_x_continuous(expand = c(0, 0))   +
  facet_wrap(~lake_centroidstate)


#### Wyoming ####

WY<-masterDF[masterDF$lake_centroidstate=="WY",]
WY2021<-WY[WY$year=="2021",]

ggplot() +
  geom_rect(data = bg.fui, 
            aes(xmin = ymin, xmax = ymax, ymin = -Inf, ymax = Inf, fill = color)) +
  geom_density_ridges(data=WY,  aes(x = dWL, y = as.factor(year), fill = "black"),
                      scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  scale_fill_identity() +
  scale_x_continuous(expand = c(0, 0)) 


ggplot(WY, mapping = aes(x = lake_lat_decdeg, y = dWL)) +
  geom_point(size = 3, shape = 20, alpha = 0.5) +
  geom_smooth(method=lm)




mapview(WY2021, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)


#ggplot maps

ggWY2021 <- st_as_sf(WY2021,
                        coords= c("lake_lon_decdeg", "lake_lat_decdeg"),
                        crs=4326) %>%
  mutate(lagoslakeid=factor(lagoslakeid))

ggplot()+
  geom_sf(data = ggWY2021, alpha = .5)+
  ggtitle("Wyoming Lakes 2021")




#convert df to spatial object
LAGOS_WE_sp <- st_as_sf(masterDF,
                        coords= c("lake_lon_decdeg", "lake_lat_decdeg"),
                        crs=4326) %>%
  filter(year == "2021") %>%
  mutate(lagoslakeid=factor(lagoslakeid))

class(LAGOS_WE_sp)

#plot our plot locations
ggplot()+
  geom_sf(data = LAGOS_WE_sp, alpha = .5)+
  ggtitle("Map of Western US lakes locations") +
  scale_fill_gradient()
  


#### The Four 2021 ####

firstfour<-masterDF[masterDF$lake_centroidstate==c("WY", "CO", "MT", "ID"),]
firstfour2021<-firstfour[firstfour$year=="2021",]



mapview(firstfour2021, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)


ggplot(firstfour2021, mapping = aes(x = dWL , y = lake_elevation_m)) +
  geom_point(size = 3, shape = 20, alpha = 0.5) +
  geom_smooth()





#### The Four 1991 ####

firstfour1991<-firstfour[firstfour$year=="1991",]



mapview(firstfour1991, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)





#### added more ####

masterdf2021<-masterDF[masterDF$year=="2021",]


mapview(masterdf2021, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)

##### interactive maps ####


masterDF <- read.csv('Data/masterDF.csv')



library(tidyverse)
library(ggridges)
library(viridis)
library(ggeffects)
library(lme4)
library(sf)
library(mapview)
library(lattice)
library(leafpop)
library(RColorBrewer)


#2021 ID, MT, WY, CO
firstfour<-masterDF[masterDF$lake_centroidstate==c("WY", "CO", "MT", "ID"),]
firstfour2021<-firstfour[firstfour$year=="2021",]



mapview(firstfour2021, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)


#1991 ID, MT, WY, CO


firstfour1991<-firstfour[firstfour$year=="1991",]



mapview(firstfour1991, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)


#2021 all west states


masterdf2021<-masterDF[masterDF$year=="2021",]


mapview(masterdf2021, 
        zcol = "dWL", 
        xcol = "lake_lon_decdeg", 
        ycol = "lake_lat_decdeg", 
        crs = 4269, 
        grid = FALSE)



