####### Basics - temporal trends ######

# 1. Read in data and libraries ####
library(tidyverse)
library(grid)
library(png)

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
                                    epanutr_zoneid=="epanutr_9"~"Xeric", T~"black"))


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
  group_by(size_group) |>
  mutate(totN = n()) |>
  ungroup() |>
  group_by(size_group, trend_cat) |>
  summarise(n = n(),
            percent = (n/totN) * 100,
            mean_slope = mean(lm_slope))|>
  ungroup() |>
  distinct() 

# factor for pretty colors
data_tally$trend_cat <- factor(data_tally$trend_cat, levels=c("Intensifying Blue","No trend - Blue","Green -> Bluer", "Blue -> Greener","No trend - Green/brown","Intensifying Green/brown"))

# tally of all data in each ecoregion
data_tally_ecoreg <- data |>
  group_by(size_group, ecoregion_name) |>
  mutate(totN = n()) |> 
  ungroup() |>
  group_by(size_group, ecoregion_name, trend_cat) |>
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
  group_by(year, size_group, trend_cat) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() |>
  group_by(year, ecoregion_name, size_group, trend_cat) |>
  mutate(Eco_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() |>
  mutate(size_group = ifelse(size_group == 'large', 'Large Lakes (>10 ha)', 'Small Lakes (<10 ha)')) 



hexcols <- tibble(
  ymin = c(470,475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583),
  ymax = c(475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583,590),
  color = c(
    "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86", 
    "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
    "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")
)


# create arrows for the plot

# png("mask.png")
# grid.polygon(c(-0.06, 0.06, 0.06, 0.15, 0, -0.15, -0.06),
#              c(-5, -5, 2.5, 2, 5, 2, 2.5), gp=gpar(fill="black"),
#              def="native",
#              vp=viewport(xs=c(-0.15, 0.15), ys=c(-5, 5)))
# dev.off()

m <- readPNG("mask.png", native=FALSE)
mdown <- readPNG('maskdown.png', native = FALSE)
mask <- matrix(rgb(m[,,1],m[,,2],m[,,3]),
               nrow=nrow(m))
maskdown <- matrix(rgb(mdown[,,1],m[,,2],m[,,3]),
               nrow=nrow(mdown))

# make greener/browner arrow
rmatbrown <- matrix(rgb(colorRamp(rev(c("#698c86", 
                                   "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
                                   "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")))(seq(0,1,length=nrow(m))), maxColorValue=255),
               nrow=nrow(m), ncol=ncol(m))
rmatbrown[mask == "#FFFFFF"] <- NA
grid.newpage()
grid.raster(rmatbrown)

# make bluer arrow
rmatblue <- matrix(rgb(colorRamp(rev(c( "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86")))(seq(0,1,length=nrow(m))), maxColorValue=255),
                    nrow=nrow(m), ncol=ncol(m))
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
  select(year, ecoregion_name, size_group, lagoslakeid, avg_dwl_year, dwl_prior2002, dwl_after2002, trend_cat, lm_slope, lake_lat_decdeg, lake_lon_decdeg) |>
  mutate(change = ifelse(dwl_prior2002 > 530 & dwl_after2002 < 530, 'Green -> Blue', ifelse(dwl_prior2002 < 530 & dwl_after2002 > 530, 'Blue -> Green', NA))) |>
  drop_na(change) |>
  group_by(year, size_group, change) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() |>
  group_by(year, ecoregion_name, size_group, change) |>
  mutate(Eco_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() 

Change_Tally <- real_change |>
  group_by(size_group, change) |>
  summarise(n = n(),
            mean_slope = mean(lm_slope))|>
  ungroup() |>
  distinct() 

Change_Tally_Ecoregion <- real_change |>
  group_by(size_group, change, ecoregion_name) |>
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

