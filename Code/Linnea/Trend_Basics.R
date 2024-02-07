####### Basics - temporal trends ######

# 1. Read in data and libraries ####
library(tidyverse)
library(grid)
library(png)
library(patchwork)
library(ggh4x) # for adding manual colors to facet wrap labels
library(sf)

# change path below to wherever you store the data
data <- read.csv('Data/2023-12-11_Temporal_Avg_LMs.csv') |> 
  # add in size group variable to delineate large vs small lakes
  mutate(size_group = ifelse(lake_waterarea_ha > 10,'large','small')) |>
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
  mutate(ecoregion_abb = case_when(epanutr_zoneid=="epanutr_1"~"CPL",
                                    epanutr_zoneid=="epanutr_2"~"NAP",
                                    epanutr_zoneid=="epanutr_3"~"NPL",
                                    epanutr_zoneid=="epanutr_4"~"SAP",
                                    epanutr_zoneid=="epanutr_5"~"SPL",
                                    epanutr_zoneid=="epanutr_6"~"TPL",
                                    epanutr_zoneid=="epanutr_7"~"UMW",
                                    epanutr_zoneid=="epanutr_8"~"WMT",
                                    epanutr_zoneid=="epanutr_9"~"XER", T~"black")) |>
  mutate(ecoregion_forlegend = case_when(epanutr_zoneid=="epanutr_1"~"Coastal Plains (CPL)",
                                    epanutr_zoneid=="epanutr_2"~"Northern Appalachians (NAP)",
                                    epanutr_zoneid=="epanutr_3"~"Northern Plains (NPL)",
                                    epanutr_zoneid=="epanutr_4"~"Southern Appalachians (SAP)",
                                    epanutr_zoneid=="epanutr_5"~"Southern Plains (SPL)",
                                    epanutr_zoneid=="epanutr_6"~"Temperate Plains (TPL)",
                                    epanutr_zoneid=="epanutr_7"~"Upper Midwest (UMW)",
                                    epanutr_zoneid=="epanutr_8"~"Western Mountains (WMT)",
                                    epanutr_zoneid=="epanutr_9"~"Xeric (XER)", T~"black"))



head(data)

#----------------------------------------#

# 2. Split data into large (>10 ha) and small lakes (<10 ha) ####
large_lakes <- data |>
  filter(size_group == 'large')

small_lakes <- data |>
  filter(size_group == 'small')

#checking to make sure we didn't lose any lakes becuase >< is not inclusive
(nrow(large_lakes) + nrow(small_lakes)) == nrow(data)

#----------------------------------------#

# 3. Tally trend categories ####
# tally of all data
data_tally <- data |>
 # group_by(size_group) |>
  mutate(totN = n()) |>
  ungroup() |>
  group_by(trend_cat) |>
 # group_by(size_group, trend_cat) |>
  summarise(n = n(),
            percent = (n/totN) * 100,
            mean_slope = mean(lm_slope))|>
  ungroup() |>
  distinct() 

# factor for pretty colors
data_tally$trend_cat <- factor(data_tally$trend_cat, levels=c("Intensifying Blue","No trend - Blue","Green -> Bluer", "Blue -> Greener","No trend - Green/brown","Intensifying Green/brown"))

# tally of all data in each ecoregion
data_tally_ecoreg <- data |>
 # group_by(size_group, ecoregion_name) |>
  group_by(ecoregion_name, ecoregion_abb, ecoregion_forlegend) |>
  mutate(totN = n()) |> 
  ungroup() |>
  group_by(ecoregion_name, trend_cat, ecoregion_abb, ecoregion_forlegend) |>
  #group_by(size_group, ecoregion_name, trend_cat) |>
  summarise(n = n(),
            percent = (n/totN) * 100,
            mean_slope = mean(lm_slope))|>
  ungroup() |>
  distinct()

# factor for pretty colors
data_tally_ecoreg$trend_cat <- factor(data_tally_ecoreg$trend_cat, levels=c("Intensifying Blue","No trend - Blue","Green -> Bluer", "Blue -> Greener","No trend - Green/brown","Intensifying Green/brown"))

# plot colors
trend_cols <- c("blue1", # Intensifying Blue,
          "#E0EEEE",     # No trend - Blue
          "skyblue2",    # Green -> Bluer
          "#A2CD5A",     # Blue -> Greener
          "#C1FFC1",     # No trend - Green/brown
          "green4")      # Intensifying Green/brown






# factor for pretty colors
data_tally_ecoreg$trend_cat <- factor(data_tally_ecoreg$trend_cat, levels=c("Intensifying Blue","No trend - Blue","Green -> Bluer","Blue -> Greener","No trend - Green/brown","Intensifying Green/brown"))



# 
# # create legend
# data_tally_ecoreg_plotting <- data_tally_ecoreg |>
#   mutate(percent = ifelse(trend_cat %in% c('Intensifying Blue', 'No trend - Blue', 'Green -> Bluer'), percent * -1, percent))
# 
# myplot_forleg <- ggplot(data_tally_ecoreg_plotting, aes(' ', percent, fill = trend_cat)) +
#   geom_bar(stat = 'identity',position = position_stack(), width = 1) +
#   scale_fill_manual('', values = trend_cols) 
# 
# # Using the cowplot package
# legend <- cowplot::get_legend(myplot_forleg)
# 
# grid.draw(legend)
# legend
# 
# 
# 
# ### For plotting 2
# # plot colors
# trend_cols2 <- c("blue1", # Intensifying Blue,
#                 "#E0EEEE",     # No trend - Blue
#                 "skyblue2",    # Green -> Bluer
#                 "green4",     # Blue -> Greener
#                 "#C1FFC1",     # No trend - Green/brown
#                 "#A2CD5A")      # Intensifying Green/brown
# 
# 
# 
# data_tally_ecoreg_plotting2 <- data_tally_ecoreg_plotting
# 
# 
# # factor for pretty colors
# data_tally_ecoreg_plotting2$trend_cat <- factor(data_tally_ecoreg_plotting2$trend_cat, levels=c("Intensifying Blue","No trend - Blue","Green -> Bluer","Intensifying Green/brown","No trend - Green/brown","Blue -> Greener"))
# 
# 
# (ggplot(data_tally_ecoreg_plotting2, aes(' ', percent, fill = trend_cat)) +
#   geom_bar(stat = 'identity',position = position_stack(), width = 1) +
#   facet_grid(~ecoregion_name) +
#   theme_classic()+
#   labs(y = "Percent of lakes\n in each ecoregion", x = NULL)+
#   theme(legend.position = 'none')+
#  # scale_y_continuous(labels = NULL) +
#   scale_fill_manual('', values = trend_cols2)) 
# 



# barplot of tally data - national scale
ggplot(data_tally, aes(size_group, n, fill = trend_cat)) +
  geom_bar(stat = 'identity') +
  scale_fill_manual('', values = trend_cols) +
  theme_classic() +
  geom_text(aes(label = paste0('n=',n,', ', round(percent,0), '%')),
            position = position_stack(vjust=0.5)) +
  labs(x='', y='') +
  scale_x_discrete(labels = c('Large lakes (>10 ha)', 'Small lakes (<10 ha)'))
ggsave('Figures/2023-12-14_NationalTrendTally.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)

# barplot of tally data - ecoregion scale
ggplot(data_tally_ecoreg, aes(size_group, n, fill = trend_cat)) +
  geom_bar(stat = 'identity') +
  scale_fill_manual('', values = trend_cols) +
  theme_bw() +
  labs(x='', y='') +
  scale_x_discrete(labels = c('Large lakes', 'Small lakes')) +
  facet_wrap(.~ecoregion_name, ncol = 3)
ggsave('Figures/2023-12-14_EcoregionTrendTally.png', width = 7, height = 5, units= 'in', dpi = 1200)

# save ecoregion tally data as a .csv in the GitHub Data folder
write.csv(data_tally_ecoreg, 'Data/Ecoregion_TrendTally.csv')

#----------------------------------------#

# 4. Slope plots ####
slopes_data <- data |>
  filter(lm_pval <= 0.05) |>
  select(trend_cat, size_group, lm_slope, ecoregion_name) |>
  distinct() |>
  mutate(size_group = ifelse(size_group == 'large', 'Large Lakes (>10 ha)', 'Small Lakes (<10 ha)')) |>
  group_by(trend_cat, size_group, ecoregion_name) |>
  mutate(mean_slope = mean(lm_slope))

# factor for pretty colors
slopes_data$trend_cat <- factor(slopes_data$trend_cat, levels=c("Intensifying Blue", "Green -> Bluer", "Blue -> Greener","Intensifying Green/brown"))

# plot colors
slope_cols <- c("blue1",       # Intensifying Blue,
               # "#E0EEEE",     # No trend - Blue
                "skyblue2",    # Green -> Bluer
                "#A2CD5A",     # Blue -> Greener
               # "#C1FFC1",     # No trend - Green/brown
                "green4")      # Intensifying Green/brown

  
ggplot(slopes_data, aes(lm_slope, trend_cat, color = trend_cat)) +
  geom_boxplot() +
  scale_color_manual(values = slope_cols) +
  geom_vline(xintercept = 0) +
  theme_bw() +
  labs(y='', x='Trend slope') +
  theme(legend.position = 'none') +
  facet_wrap(.~size_group, ncol=1) 

ggsave('Figures/2023-12-14_SlopesBoxplot.png', width = 7, height = 5, units= 'in', dpi = 1200)

# boxplots of tally info in each ecoregion
ggplot(slopes_data |> filter(size_group == 'Large Lakes (>10 ha)'), 
       aes(lm_slope, trend_cat, color = trend_cat)) +
  geom_boxplot() +
  scale_color_manual(values = slope_cols) +
  geom_vline(xintercept = 0) +
  theme_bw() +
  labs(y='', x='Trend slope', title = 'Large Lakes (>10 ha)') +
  theme(legend.position = 'none') +
  facet_wrap(.~ecoregion_name, ncol=3) 

ggsave('Figures/2023-12-15_SlopesBoxplot_LARGE_ecoregion.png', width = 8, height = 6, units= 'in', dpi = 1200)

# boxplots of tally info in each ecoregion
ggplot(slopes_data |> filter(size_group == 'Small Lakes (<10 ha)'), 
       aes(lm_slope, trend_cat, color = trend_cat)) +
  geom_boxplot() +
  scale_color_manual(values = slope_cols) +
  geom_vline(xintercept = 0) +
  theme_bw() +
  labs(y='', x='Trend slope', title = 'Small Lakes (<10 ha)') +
  theme(legend.position = 'none') +
  facet_wrap(.~ecoregion_name, ncol=3) 

ggsave('Figures/2023-12-15_SlopesBoxplot_SMALL_ecoregion.png', width = 8, height = 6, units= 'in', dpi = 1200)

#----------------------------------------#

# 5. Lakes that switch colors plots ####
color_change_data <- data |>
  filter(trend_cat %in% c('Blue -> Greener', 'Green -> Bluer')) |>
  #group_by(year, size_group, trend_cat) |>
  group_by(year, trend_cat) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() |>
  #group_by(year, ecoregion_name, size_group, trend_cat) |>
  group_by(year, ecoregion_name, ecoregion_abb, trend_cat) |>
  mutate(Eco_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup()# |>
 # mutate(size_group = ifelse(size_group == 'large', 'Large Lakes (>10 ha)', 'Small Lakes (<10 ha)')) 



hexcols <- tibble(
  ymin = c(470,475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583),
  ymax = c(475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583,590),
  color = c(
    "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86", 
    "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
    "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")
)


# create arrows for the plot

png("maskup.png")
grid.polygon(c(-0.06, 0.06, 0.06, 0.15, 0, -0.15, -0.06),
             c(-5, -5, 2.5, 2, 5, 2, 2.5), gp=gpar(fill="black"),
             def="native",
             vp=viewport(xs=c(-0.15, 0.15), ys=c(-5, 5)))
dev.off()

mup <- readPNG("maskup.png", native=FALSE)
mdown <- readPNG('maskdown.png', native = FALSE)
maskup <- matrix(rgb(mup[,,1],mup[,,2],mup[,,3]),
               nrow=nrow(mup))
maskdown <- matrix(rgb(mdown[,,1],mdown[,,2],mdown[,,3]),
               nrow=nrow(mdown))

# make greener/browner arrow
rmatbrown <- matrix(rgb(colorRamp(rev(c("#698c86", 
                                   "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
                                   "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")))(seq(0,1,length=nrow(mup))), maxColorValue=255),
               nrow=nrow(mup), ncol=ncol(mup))
rmatbrown[maskup == "#FFFFFF"] <- NA
grid.newpage()
grid.raster(rmatbrown)

# make bluer arrow
rmatblue <- matrix(rgb(colorRamp(rev(c( "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86")))(seq(0,1,length=nrow(mdown))), maxColorValue=255),
                    nrow=nrow(mdown), ncol=ncol(mdown))
rmatblue[maskdown == "#FFFFFF"] <- NA
grid.newpage()
grid.raster(rmatblue)


color_change_data |> 
  filter(trend_cat == 'Blue -> Greener') |>
  ggplot() +
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength', title = 'Blue -> Greener') +
  geom_hline(yintercept = 530, color = '#698c86')  +
  scale_x_continuous(expand = c(0,0)) +
  facet_wrap(~size_group, ncol = 1)   +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
  annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)

ggsave('Figures/2023-12-15_Color_Change_B-G.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)



color_change_data |> 
  filter(trend_cat == 'Green -> Bluer') |>
  ggplot() +
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength', title = 'Green -> Bluer') +
  geom_hline(yintercept = 530, color = '#698c86')  +
  scale_x_continuous(expand = c(0,0)) +
  facet_wrap(~size_group, ncol = 1)   +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
  annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)

ggsave('Figures/2023-12-15_Color_Change_G-B.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)

## 5a. How many lakes actually switch color and not just trend that way? ####
real_change <- color_change_data |>
  group_by(lake_nhdid) %>%
  mutate(dwl_after2002=mean(avg_dwl_year[year > 2002])) %>%
  ungroup() |>
  # select(year, ecoregion_name, size_group, lagoslakeid, avg_dwl_year, dwl_prior2002, dwl_after2002, trend_cat, lm_slope, lake_lat_decdeg, lake_lon_decdeg) |>
  select(year, ecoregion_name, ecoregion_abb, lagoslakeid, avg_dwl_year, dwl_prior2002, dwl_after2002, trend_cat, lm_slope, lake_lat_decdeg, lake_lon_decdeg) |>
  mutate(change = ifelse(dwl_prior2002 > 530 & dwl_after2002 < 530, 'Green -> Blue', ifelse(dwl_prior2002 < 530 & dwl_after2002 > 530, 'Blue -> Green', NA))) |>
  drop_na(change) |>
  # group_by(year, size_group, change) |>
  group_by(year,  change) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() |>
  #group_by(year, ecoregion_name, size_group, change) |>
  group_by(year, ecoregion_name, ecoregion_abb,  change) |>
  mutate(Eco_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() 

Change_Tally <- real_change |>
  # group_by(size_group, change) |>
  group_by(change) |>
  summarise(n = n(),
            mean_slope = mean(lm_slope))|>
  ungroup() |>
  distinct() 

Change_Tally_Ecoregion <- real_change |>
 # group_by(size_group, change, ecoregion_name) |>
  group_by(change, ecoregion_name, ecoregion_abb) |>
  summarise(n = n(),
            mean_slope = mean(lm_slope))|>
  ungroup() |>
  distinct() 


ggplot(Change_Tally, aes(size_group, n, fill = change)) +
  geom_bar(stat = 'identity') +
  scale_fill_manual('', values = c("#A2CD5A", "skyblue2")) +
  theme_bw() +
  geom_text(aes(label = paste0('n=',n)), 
            position = position_stack(vjust=0.5)) +
  labs(x='', y='') +
  scale_x_discrete(labels = c('Large lakes (>10 ha)', 'Small lakes (<10 ha)'))
ggsave('Figures/2023-12-15_National_REALCHANGES.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)


ggplot(Change_Tally_Ecoregion, aes(size_group, n, fill = change)) +
  geom_bar(stat = 'identity') +
  scale_fill_manual('', values = c("#A2CD5A", "skyblue2")) +
  theme_bw() +
  geom_text(aes(label = paste0('n=',n)), 
            position = position_stack(vjust=0.5), size=3) +
  labs(x='', y='') +
  scale_x_discrete(labels = c('Large lakes', 'Small lakes')) +
  facet_wrap(.~ecoregion_name, ncol=3, scales = 'free')
ggsave('Figures/2023-12-15_Ecoregion_REALCHANGES.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)


head(real_change)


real_change |> 
  filter(trend_cat == 'Blue -> Greener') |>
  ggplot() +
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength', title = 'Blue -> Greener') +
  geom_hline(yintercept = 530, color = '#698c86')  +
  scale_x_continuous(expand = c(0,0)) +
  facet_wrap(~size_group, ncol = 1)   +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=460) +
  annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)

ggsave('Figures/2023-12-15_RealColorChange_blue-green.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)



real_change |> 
  filter(trend_cat == 'Green -> Bluer') |>
  ggplot() +
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength', title = 'Green -> Bluer') +
  geom_hline(yintercept = 530, color = '#698c86')  +
  scale_x_continuous(expand = c(0,0)) +
  facet_wrap(~size_group, ncol = 1)   +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=460) +
  annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)

ggsave('Figures/2023-12-15_RealColorChange_green-blue.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)

## 5b. Map true change lakes ####
states <- map_data("state")

ggplot(data = real_change, 
       aes(x = lake_lon_decdeg, y = lake_lat_decdeg, color=change)) +
  geom_point() +
  geom_polygon(data= states, aes(x = long, y = lat, group = group),
               fill="transparent",color = "black", linewidth=0.5) +
  scale_color_manual('',values = c("#A2CD5A", "skyblue2")) + 
  theme_minimal() +
  coord_fixed(1.3) +
  labs(x = '', y= '') +
  theme(legend.position = c(0.2, 0.2))
ggsave('Figures/2023-12-15_RealColorChange_Map.png', width = 6.5, height = 4.5, units= 'in', dpi = 1200)


# 6. Figure 2 ####
ecoreg_cols <- c(
  "dodgerblue2", 
  "#E31A1C", # red
  "green4",
  "#6A3D9A", # purple
  "#FF7F00", # orange
  "black", 
  "gold1",
  "skyblue2", 
  "#FB9A99")

## FIG2a) data tally in each ecoregion ####
p1 <- ggplot(data_tally_ecoreg, aes(' ', percent, fill = trend_cat)) +
    geom_bar(stat = 'identity',position = position_stack(), width = 1) +
    #facet_grid(~ecoregion_abb) +
    theme_classic()+
    labs(y = "Percent of lakes\n in each ecoregion", x = NULL)+
    scale_fill_manual('', values = trend_cols) +
  facet_grid2(
    .~ecoregion_abb, 
    strip = strip_themed(
      background_x = list(element_rect(color = ecoreg_cols[1], size =2),
                          element_rect(color = ecoreg_cols[2], size =2),
                          element_rect(color = ecoreg_cols[3], size =2),
                          element_rect(color = ecoreg_cols[4], size =2),
                          element_rect(color = ecoreg_cols[5], size =2),
                          element_rect(color = ecoreg_cols[6], size =2),
                          element_rect(color = ecoreg_cols[7], size =2),
                          element_rect(color = ecoreg_cols[8], size =2),
                          element_rect(color = ecoreg_cols[9], size =2))
    )
  )
p1

## FIG2b) ecoregion plot ####
regions.sf <- read_sf("Data/aggr_ecoregions_2015/Aggr_Ecoregions_2015.shp")|>
  mutate(WSA9_NAME = ifelse(WSA9_NAME == "Temporate Plains", "Temperate Plains", WSA9_NAME))

p2 <- ggplot() +
  geom_sf(data = regions.sf, aes(fill = WSA9_NAME)) +
  scale_fill_manual('',values=ecoreg_cols) +
  theme_bw()

## FIG2c) lakes that changed colors ####
p3<- ggplot(Change_Tally_Ecoregion, aes(' ', n, fill = change)) +
  geom_bar(stat = 'identity',position = position_stack(), width = 1) +
  #facet_grid(~ecoregion_abb) +
  theme_classic()+
  labs(y = "No. of lakes\n in each ecoregion", x = NULL)+
  scale_fill_manual('', values = c("#A2CD5A", "skyblue2")) +
  geom_text(aes(label = paste0('n=',n)), 
            position = position_stack(vjust=0.5), size=3) +
  facet_grid2(
    .~ecoregion_abb, 
    strip = strip_themed(
      background_x = list(element_rect(color = ecoreg_cols[1], size =2),
                          element_rect(color = ecoreg_cols[2], size =2),
                          element_rect(color = ecoreg_cols[3], size =2),
                          element_rect(color = ecoreg_cols[4], size =2),
                          element_rect(color = ecoreg_cols[5], size =2),
                          element_rect(color = ecoreg_cols[6], size =2),
                          element_rect(color = ecoreg_cols[7], size =2),
                          element_rect(color = ecoreg_cols[8], size =2),
                          element_rect(color = ecoreg_cols[9], size =2))
    )
  )


## FIG2d) map of lakes that changed colors ####
real_change.sf <- st_as_sf(real_change, coords = c('lake_lon_decdeg', 'lake_lat_decdeg'), crs = 4326)


p4<-ggplot() +
  geom_sf(data = regions.sf, fill = 'white') +
  geom_sf(data = real_change.sf, aes(color=change)) +
  scale_color_manual('',values = c("#A2CD5A", "skyblue2")) +
  theme_bw()+
  labs(x = '', y= '') +
  # theme(legend.position = c(0.2, 0.2))
  theme(legend.position = 'none')

layout = 'AAB
          CCD'

p1 + p2 + p3 + p4 +
  plot_layout(design=layout) +
  plot_annotation(tag_levels = 'a', tag_suffix = ')') & 
  theme(plot.tag = element_text(size = 8)) & theme(plot.margin = margin(0,0,0,0, "cm"))

p1
p2
p3
p4
