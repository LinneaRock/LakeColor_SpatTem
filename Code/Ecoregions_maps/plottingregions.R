# Creating ecoregions plots for slopes fig

library(sf)
library(tidyverse)

ecoreg_cols <- c(
  "dodgerblue2", # Coastal Plains
  "#E31A1C",     # N. Apps
  "green4",      # N. Plains
  "#6A3D9A",     # S. Apps
  "#FF7F00",     # S. Plains
  "black",       # Temperate Plains
  "gold1",       # Upper Midwest
  "skyblue2",    # W. Mtns
  "#FB9A99")     # Xeric

# This reads in the shapefiles for ecoregions 
regions.sf <- read_sf("Data/aggr_ecoregions_2015/Aggr_Ecoregions_2015.shp")|>
  # fix this dumbass typo
  mutate(WSA9_NAME = ifelse(WSA9_NAME == "Temporate Plains", "Temperate Plains", WSA9_NAME))


ggplot() +
  geom_sf(regions.sf |> select(-WSA9), mapping=aes(),fill='white', color='grey30') +
  geom_sf(regions.sf, mapping=aes(fill=WSA9),color='black') +
  theme_minimal() +
  labs(x = "", y = "") +
  scale_fill_manual("", values=ecoreg_cols) +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0, family = "serif"),
        legend.position = 'none',
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  facet_wrap(~WSA9)

ggsave('Code/Ecoregions_maps/facetedregions.png', height = 4.5, width = 6.5, units = "in", dpi = 1200)
