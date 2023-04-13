masterDF <- read.csv('Data/masterDF.csv')

library(tidyverse)
library(ggridges)
library(viridis)
library(ggeffects)
library(lme4)








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
  geom_density_ridges(data=masterDF,  aes(x = dWL, y = as.factor(year), fill = "black"),
                      scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  scale_fill_identity() +
  scale_x_continuous(expand = c(0, 0)) 




WY<-masterDF[masterDF$lake_centroidstate=="WY",]


ggplot() +
  geom_rect(data = bg.fui, 
            aes(xmin = ymin, xmax = ymax, ymin = -Inf, ymax = Inf, fill = color)) +
  geom_density_ridges(data=WY,  aes(x = dWL, y = as.factor(year), fill = "black"),
                      scale= 1, alpha = 0.5, rel_min_height = 0.01) +
  scale_fill_identity() +
  scale_x_continuous(expand = c(0, 0)) 
