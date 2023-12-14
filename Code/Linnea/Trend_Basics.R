####### Basics - temporal trends ######

# 1. Read in data and libraries ####
library(tidyverse)
library(gt) # for making table
library(webshot2) # for saving tables as .png

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


#----------------------------------------#













legend<-data %>%
  select(epanutr_zoneid , ecoregion_name, ecoreg_color) %>%
  distinct() %>% arrange(epanutr_zoneid)



