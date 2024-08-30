#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Script to create figure 3 #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# 1. Read in libraries, data, and set color schemes ####
library(tidyverse)
library(png)
library(grid)


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


# the dataset above has one row per lake, but for this figure we need all data
annual_data <- read.csv('Data/2024-08-29_lake_color_linear_models.csv')


# 2. Create the arrows ####
hexcols <- tibble(
  ymin = c(470,475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583),
  ymax = c(475,480,485,489,495,509,530,549,559,564,567,568,569,570,573,575,577,579,581,583,590),
  color = c(
    "#2158bc", "#316dc5", "#327cbb", "#4b80a0", "#568f96", "#6d9298", "#698c86", 
    "#759e72", "#7ba654", "#7dae38", "#94b660","#94b660", "#a5bc76", "#aab86d", 
    "#adb55f", "#a8a965", "#ae9f5c", "#b3a053", "#af8a44", "#a46905", "#9f4d04")
)


# create arrows for the plot

# skip lines 88-100 if you are working from the GitHub
# png("maskup.png")
# grid.polygon(c(-0.06, 0.06, 0.06, 0.15, 0, -0.15, -0.06),
#              c(-5, -5, 2.5, 2, 5, 2, 2.5), gp=gpar(fill="black"),
#              def="native",
#              vp=viewport(xs=c(-0.15, 0.15), ys=c(-5, 5)))
# dev.off()
# 
# png("maskdown.png")
# grid.polygon(c(-0.06, 0.06, 0.06, 0.15, 0, -0.15, -0.06),
#              c(-5, -5, 2.5, 2, 5, 2, 2.5), gp=gpar(fill="black"),
#              def="native",
#              vp=viewport(xs=c(0.15, -0.15), ys=c(5, -5)))
# dev.off()

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

# 3. Plot trends ####
int_f3 <- data |>
  filter(trend_cat_switch %in% c('Green -> Bluer', 'Shift to blue', 'Blue -> Greener', 'Shift to green')) |>
  select(lake_nhdid, trend_cat_switch)

data_f3_a <- left_join(int_f3, annual_data) |>
  select(lake_nhdid, trend_cat_switch, year, avg_dwl_year, lm_slope) |>
  mutate(trend_cat_switch = factor(trend_cat_switch, levels=c('Shift to blue', 'Blue -> Greener', 'Green -> Bluer', 'Shift to green'))) |>
  group_by(year, trend_cat_switch) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() 

# when does the trend line cross the color shift threshold? 
threshold <- data_f3_a |>
  filter(trend_cat_switch %in% c('Shift to blue', 'Shift to green')) |>
  select(trend_cat_switch, year, Nat_avgdwl_year) |>
  filter(year > 2000 & 
           year < 2010) |>
  distinct()


ggplot(data_f3_a) +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lake_nhdid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year), linewidth=2) +
  theme_bw() +
  labs(x = '', y = '') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86', linewidth=2)  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=590) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=470) +
  theme(axis.text=element_text(color="black",size=15), # make all font black
        axis.title=element_text(size=15), #change font size of all text
        axis.title.y=element_blank(),
        panel.grid.minor = element_blank(), 
        panel.grid.major.x = element_blank(),
        plot.margin = margin(0.5,0.5, 0, 0, "cm")) +
  facet_wrap(~trend_cat_switch, ncol=1) +
  theme(strip.text = element_blank())

ggsave('Figures/Figure3/trend_lines.png', height=12, width=5, units='in',dpi=1200)


# 5. Plot histograms of slopes in each category ####
# add quantiles to data

data_f3_b <- data_f3_a |>
  select(lake_nhdid, lm_slope, trend_cat_switch) |>
  distinct() |>
  group_by(trend_cat_switch) |>
  mutate(q1 = quantile(lm_slope, 0.25),
         q2 = quantile(lm_slope, 0.5),
         q3 = quantile(lm_slope, 0.75)) |>
  # get averages and standard deviations as well
  mutate(ave_slope = mean(lm_slope),
         sd_slope = sd(lm_slope)) |>
  ungroup()
  

# grab averages and sd to report
mean_slopes <- data_f3_b |>
  select(trend_cat_switch, ave_slope, sd_slope) |>
  unique()

ggplot(data_f3_b) +
  geom_histogram(aes(lm_slope), binwidth=0.05) +
  geom_vline(xintercept = 0, color = "black", linewidth=1.5) +
  geom_vline(aes(xintercept = q1, color=trend_cat_switch), linetype = "dashed", linewidth=1.3) +
  geom_vline(aes(xintercept = q2, color=trend_cat_switch), linewidth=1.7) +
  geom_vline(aes(xintercept = q3, color=trend_cat_switch), linetype = "dashed", linewidth=1.3) +
  theme_bw() +
  theme(axis.text=element_text(color="black",size=15), # make all font black
        axis.ticks.x = element_line(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank())+
  labs(y='',x='') +
  xlim(-3, 2.5) +
  facet_wrap(~trend_cat_switch, ncol=1, scales = 'free_y') +
  scale_color_manual(values=c("#327cbb", "#568f96","#759e72", "#94b660")) +
  theme(strip.text = element_blank(),
        legend.position = 'none')

ggsave('Figures/Figure3/histograms.png', height=12, width=5, units='in',dpi=1200)



# 6. Save datasets to make these figs ####
write.csv(data_f3_a, 'Data/Figure3_timeseriesData.csv')
write.csv(data_f3_b, 'Data/Figure3_histogramsData.csv')


# what year did average data shift to blue? 
blue <- data_f3_a |>
  filter(trend_cat_switch == 'Shift to blue') |>
  select(year, Nat_avgdwl_year) |>
  distinct() # between 2002 and 2003


# what year did average data shift to green? 
green <- data_f3_a |>
  filter(trend_cat_switch == 'Shift to green') |>
  select(year, Nat_avgdwl_year) |>
  distinct() # between  2003 and 2004, dips below line in 2005, then crosses again 2006
