#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Script to create figure 2 #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#



# 1. Read in libraries, data, and set color schemes ####
library(tidyverse)
library(patchwork)
library(ggh4x) # for adding manual colors to facet wrap labels
library(sf)
library(ggpattern)


# data downloaded from supercomputer to my hard drive because I'm not able to get sf to install to beartooth
data <-readRDS("Data/2024-08-29_lakecolor_climate_landcover_trends.rds") |>
  # add names of ecoregions
  mutate(ecoregion_name = case_when(epanutr_zoneid=="epanutr_1"~"Coastal Plains",
                                    epanutr_zoneid=="epanutr_2"~"Northern Appalachians",
                                    epanutr_zoneid=="epanutr_3"~"Northern Plains",
                                    epanutr_zoneid=="epanutr_4"~"Southern Appalachians",
                                    epanutr_zoneid=="epanutr_5"~"Southern Plains",
                                    epanutr_zoneid=="epanutr_6"~"Temperate Plains",
                                    epanutr_zoneid=="epanutr_7"~"Upper Midwest",
                                    epanutr_zoneid=="epanutr_8"~"Western Mountains",
                                    epanutr_zoneid=="epanutr_9"~"Xeric", T~"black")) |>
  # add ecoregion abbrevations too
  mutate(ecoregion_abb = case_when(epanutr_zoneid=="epanutr_1"~"CPL",
                                   epanutr_zoneid=="epanutr_2"~"NAP",
                                   epanutr_zoneid=="epanutr_3"~"NPL",
                                   epanutr_zoneid=="epanutr_4"~"SAP",
                                   epanutr_zoneid=="epanutr_5"~"SPL",
                                   epanutr_zoneid=="epanutr_6"~"TPL",
                                   epanutr_zoneid=="epanutr_7"~"UMW",
                                   epanutr_zoneid=="epanutr_8"~"WMT",
                                   epanutr_zoneid=="epanutr_9"~"XER", T~"black")) 


length(unique(data$lake_nhdid)) # each row is a single lake


# This reads in the shapefiles for ecoregions 
regions.sf <- read_sf("Data/aggr_ecoregions_2015/Aggr_Ecoregions_2015.shp")|>
  # fix this dumbass typo
  mutate(WSA9_NAME = ifelse(WSA9_NAME == "Temporate Plains", "Temperate Plains", WSA9_NAME))

# colors for plots
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



# re-org these for easier to read legend/figure
trend_cols <- c("blue1",       # Intensifying Blue,
                "skyblue2",    # Lake became blue -- add green stripes
                '#3d7db0ff',    # Blue -> Greener (stayed blue)
                "#E0EEEE",     # No trend - Blue
                
                "#C1FFC1",     # No trend - Green/brown
                '#348555ff',     # Green -> Bluer (stayed green)
                "#A2CD5A",     # lake became green -- add blue stripes
                "green4")      # Intensifying Green/brown


# 2. Tally trends ####
data_tally_ecoreg  <- data |>
  group_by(ecoregion_name, ecoregion_abb) |>
  mutate(totN = n()) |> 
  ungroup() |>
  group_by(ecoregion_name, trend_cat_switch, ecoregion_abb) |>
  reframe(n = n(),
          percent = (n/totN) * 100,
          mean_slope = mean(lm_slope_color))|>
  ungroup() |>
  distinct()

sum((data_tally_ecoreg |> 
          filter(trend_cat_switch %in% c('No trend - Blue', 'No trend - Green')))$n) / sum(data_tally_ecoreg$n) * 100

sum((data_tally_ecoreg |> 
       filter(trend_cat_switch %in% c('Shift to blue', 'Shift to green')))$n) / sum(data_tally_ecoreg$n) * 100

# save ecoregion tally data as a .csv in the GitHub Data folder
write.csv(data_tally_ecoreg, 'Data/Ecoregion_TrendTally.csv')


# 3. Format data for plotting ####
# rewrite all trends to uncapitalize
data_tally_ecoreg <- data_tally_ecoreg |>
  mutate(trend_cat_switch = case_when(trend_cat_switch=='Intensifying Blue'~'Intensifying blue',
                                      trend_cat_switch=='Shift to blue'~'Shift to blue',
                                      trend_cat_switch=='Blue -> Greener'~'Blue -> greener',
                                      trend_cat_switch=='No trend - Blue'~'No trend - blue',
                                      trend_cat_switch=='No trend - Green/brown'~'No trend - green/brown',
                                      trend_cat_switch=='Green -> Bluer'~'Green -> bluer',
                                      trend_cat_switch=='Shift to green'~'Shift to green',
                                      trend_cat_switch=='Intensifying Green/brown'~'Intensifying green/brown'))

# factor for pretty colors
data_tally_ecoreg$trend_cat_switch <- factor(data_tally_ecoreg$trend_cat_switch, levels=c("Intensifying blue",'Shift to blue', "Blue -> greener","No trend - blue", "No trend - green/brown", "Green -> bluer",'Shift to green', "Intensifying green/brown"))


# 4. Part a of Figure 2 ####
ggplot(data_tally_ecoreg, aes(' ', percent, fill = trend_cat_switch, pattern=trend_cat_switch, pattern_color=trend_cat_switch)) +
  geom_bar_pattern(stat = 'identity',position = position_stack(), width = 1, pattern_density=0.005) +
  #facet_grid(~ecoregion_abb) +
  theme_classic() +
  labs(y = "Percent of lakes in\n each trend category", x = NULL) +
  scale_fill_manual('', values = trend_cols) +
  scale_pattern_manual(values=c('none','stripe','none','none','none','none','stripe', 'none')) +
  scale_pattern_color_manual(values=c('none','#348555ff','none','none','none','none', '#3d7db0ff','none')) +
  facet_grid2(
    .~ecoregion_abb 
    # strip = strip_themed(
    #   background_x = list(element_rect(color = ecoreg_cols[1], linewidth=2),
    #                       element_rect(color = ecoreg_cols[2], linewidth=2),
    #                       element_rect(color = ecoreg_cols[3], linewidth=2),
    #                       element_rect(color = ecoreg_cols[4], linewidth=2),
    #                       element_rect(color = ecoreg_cols[5], linewidth=2),
    #                       element_rect(color = ecoreg_cols[6], linewidth=2),
    #                       element_rect(color = ecoreg_cols[7], linewidth=2),
    #                       element_rect(color = ecoreg_cols[8], linewidth=2),
    #                       element_rect(color = ecoreg_cols[9], linewidth=2))
    # )
  ) +
  theme(legend.position = 'none',
        strip.text = element_blank())



ggsave('C:/PhD_code/LakeColor_SpatTem/Figures/Figure2/p1.png',height=4.5, width=6.5, units='in', dpi=1200)

# make simple one just for legend
ggplot(data_tally_ecoreg, aes(' ', percent, fill = trend_cat_switch)) +
  geom_bar(stat = 'identity') +
  theme_minimal() +
  scale_fill_manual('', values = trend_cols) 

ggsave('C:/PhD_code/LakeColor_SpatTem/Figures/Figure2/p1_legend.png',height=4.5, width=6.5, units='in', dpi=1200)


# 5. Part b of Figure 2 ####

regions.sf.names <- regions.sf |>
  mutate(name = paste0(WSA9_NAME, ' (', WSA9, ')'))

p2 <- ggplot() +
  geom_sf(data = regions.sf.names, aes(fill = name)) +
  scale_fill_manual('',values=ecoreg_cols) +
  theme_minimal() +
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
        panel.grid.minor = element_blank())

p2

ggsave('Figures/Figure2/p2.png',height=4.5, width=6.5, units='in', dpi=1200)


# ecoregion figure for supplement
ggplot() +
  geom_sf(data = regions.sf.names, aes(fill = name)) +
  scale_fill_manual('',values=ecoreg_cols) +
  theme_bw()


ggsave('Figures/ecoregions.png',height=4.5, width=6.5, units='in', dpi=1200)



# 6. Part c of Figure 2 ####
p3 <- ggplot(data_tally_ecoreg |> filter(trend_cat_switch %in% c('Shift to blue', 'Shift to green')), aes(' ', n, color=trend_cat_switch, fill=trend_cat_switch, pattern=trend_cat_switch, pattern_color=trend_cat_switch)) +
  geom_bar_pattern(stat = 'identity',position = position_stack(), width = 1, pattern_density=0.0001, linewidth=1) +
  #geom_bar(stat = 'identity',position = position_stack(), width = 1) +
  #facet_grid(~ecoregion_abb) +
  theme_classic()+
  labs(y = "No. of lakes that \n switched colors", x = NULL)+
  scale_color_manual('', values = c("skyblue2","#A2CD5A")) +
  scale_fill_manual('', values = c("skyblue2","#A2CD5A")) +
  scale_pattern_manual(values=c('stripe','stripe')) +
  scale_pattern_color_manual(values=c('#348555ff','#3d7db0ff')) +
  # geom_text(aes(label = n), check_overlap = TRUE,
  #           position = position_stack(vjust=0.5), size=3) +
  facet_grid2(
    .~ecoregion_abb, 
    strip = strip_themed(
      background_x = list(element_rect(color = ecoreg_cols[1], linewidth=2),
                          element_rect(color = ecoreg_cols[2], linewidth=2),
                          element_rect(color = ecoreg_cols[3], linewidth=2),
                          element_rect(color = ecoreg_cols[4], linewidth=2),
                          element_rect(color = ecoreg_cols[5], linewidth=2),
                          element_rect(color = ecoreg_cols[6], linewidth=2),
                          element_rect(color = ecoreg_cols[7], linewidth=2),
                          element_rect(color = ecoreg_cols[8], linewidth=2),
                          element_rect(color = ecoreg_cols[9], linewidth=2))
    )
  ) +
  #theme(legend.position = c(0.25, 0.75))
  theme(legend.position='none',
        strip.background = element_blank(), strip.text = element_blank())

p3

ggsave('Figures/Figure2/p3.png', height=4.5, width=6.5, units='in',dpi=1200)

# 7. Part d of Figure 2 ####
# transform our real change data to sf object
real_change.sf <- st_as_sf(data |> filter(trend_cat_switch %in% c('Shift to blue', 'Shift to green')), coords = c('lake_lon_decdeg', 'lake_lat_decdeg'), crs = 4326)

# plot
p4 <- ggplot() +
  geom_sf(data = regions.sf, fill = 'white') +
  geom_sf(data = real_change.sf, aes(color=trend_cat_switch)) +
  scale_color_manual('',values = c("skyblue2","#A2CD5A"))+ 
  theme_bw()+
  labs(x = '', y= '') +
  theme_minimal() +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0, family = "serif"),
        legend.position = 'none', # removed legend because it is redundant with fig 2c
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

p4

ggsave('Figures/Figure2/p4.png', height=4.5, width=6.5, units='in', dpi=1200)


p1/p3 + plot_annotation(tag_levels = 'a', tag_suffix = ')')

ggsave('Figures/Figure2/a_b.png', height=6, width=8, units='in', dpi=1200)





