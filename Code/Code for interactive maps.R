#Interactive maps for lake color

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


# 1991 ID, MT, WY, CO


firstfour1991<-firstfour[firstfour$year=="1991",]



mapview(firstfour1991,
        zcol = "dWL",
        xcol = "lake_lon_decdeg",
        ycol = "lake_lat_decdeg",
        crs = 4269,
        grid = FALSE)


# 2021 all west states


masterdf2021<-masterDF[masterDF$year=="2021",]


mapview(masterdf2021,
        zcol = "dWL",
        xcol = "lake_lon_decdeg",
        ycol = "lake_lat_decdeg",
        crs = 4269,
        grid = FALSE)
