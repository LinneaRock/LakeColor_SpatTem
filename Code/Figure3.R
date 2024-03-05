#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Script to create figure 3 #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# 1. Read in libraries, data, and set color schemes ####
library(tidyverse)
library(png)
library(grid)



# below is our finalized dataset saved to Beartooth on 2023-12-11
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


trend_cols <- c("blue1",       # Intensifying Blue,
                "#E0EEEE",     # No trend - Blue
                "skyblue2",    # Blue -> Greener
                "#A2CD5A",     # Green -> Bluer
                "#C1FFC1",     # No trend - Green/brown
                "green4")      # Intensifying Green/brown


# 2. Subset data with the trends we want to keep ####

# find lakes that ACTUALLY shifted from blue to green or green to blue 
trend_change <- data |>
  filter(trend_cat %in% c('Blue -> Greener', 'Green -> Bluer')) |>
  group_by(lake_nhdid) %>%
  mutate(dwl_after2002=mean(avg_dwl_year[year > 2002])) %>%
  ungroup() |>
  select(year, ecoregion_name, ecoregion_abb, lagoslakeid, avg_dwl_year, dwl_prior2002, dwl_after2002, trend_cat, lm_slope, lake_lat_decdeg, lake_lon_decdeg) |>
  mutate(change = ifelse(dwl_prior2002 > 530 & dwl_after2002 < 530, 'Shift to blue', ifelse(dwl_prior2002 < 530 & dwl_after2002 > 530, 'Shift to green', NA))) |>
  drop_na(change) |>
  # get overall average trend data
  group_by(year,  change) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() 

shift_ids <- unique(trend_change$lagoslakeid) # 5133 lakes shifted color

# find lakes that trended but did not shift color  
trend_no_change <- data |>
  filter(trend_cat %in% c('Blue -> Greener', 'Green -> Bluer')) |>
  filter(!lagoslakeid %in% shift_ids) |>
  # get overall average trend data
  group_by(year, trend_cat) |>
  mutate(Nat_avgdwl_year = mean(avg_dwl_year)) |>
  ungroup() 


# 3. Create the arrows ####
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

# 4. First panel of Fig 3 ####
## 4a. Green to blue lakes ####

# plot lakes that trended green toward blue, but did not change
c1 <- trend_no_change |> 
  filter(trend_cat == 'Green -> Bluer') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86')  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=460)# +
# these lines add text to the arrows (good for presentation, not for publication?)
  # annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
  # annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
  # annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c1

ggsave('Figures/Figure3/c1.png', height=3, width=5, units='in')



# plot lakes that shifted from green to blue
c2 <- trend_change |> 
  filter(change == 'Shift to blue') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86')  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=460)# +
# these lines add text to the arrows (good for presentation, not for publication?)
# annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
# annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
# annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c2


ggsave('Figures/Figure3/c2.png', height=3, width=5, units='in')


## 4b. Blue to green lakes ####

# plot lakes that trended blue to greener, but did not change
c3 <- trend_no_change |> 
  filter(trend_cat == 'Blue -> Greener') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86')  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=510, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=545, ymax=460)# +
# something fucking weird up with the arrows on this one 
# these lines add text to the arrows (good for presentation, not for publication?)
# annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
# annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
# annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c3

ggsave('Figures/Figure3/c3.png', height=3, width=5, units='in')


# plot lakes that shifted from blue to greener
c4 <- trend_change |> 
  filter(change== 'Shift to green') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year)) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86')  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=515, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=545, ymax=460)# +
# these lines add text to the arrows (good for presentation, not for publication?)
# annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
# annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
# annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c4

ggsave('Figures/Figure3/c4.png', height=3, width=5, units='in')

# 5. Histograms of slopes in each category ####

# histogram for first figure above - trending green to blue, no change

q2 <- median((trend_no_change |>
       filter(trend_cat == 'Green -> Bluer'))$lm_slope)

q1 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Green -> Bluer'))$lm_slope, 0.25)

q3 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Green -> Bluer'))$lm_slope, 0.75)

h1 <- trend_no_change |>
  filter(trend_cat == 'Green -> Bluer') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope), binwidth=0.1) +
  geom_vline(xintercept = c(q1, q2, q3)) +
  theme_minimal() +
  labs(y='',x='') +
  xlim(-3.8, 2.5)
h1



# histogram for second figure above - shifted from green to blue
h2 <- trend_change |>
  filter(change == 'Shift to blue') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope), binwidth=0.1) +
  theme_minimal() +
  labs(y='',x='') +
  xlim(-4,2.5)
h2



# histogram for first figure above - trending blue to green, no change
h3 <- trend_no_change |>
  filter(trend_cat == 'Blue -> Greener') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope),binwidth=0.1) +
  theme_minimal() +
  labs(y='',x='') +
  xlim(-4,2.5)
h3

png('C:/PhD_code/LakeColor_SpatTem/Figures/Figure2/h3.png', height=4.5, width=6.5, units='in', res=500)
h3
dev.off()

# histogram for fourth figure above - shifted from blue to green
h4 <- trend_change |>
  filter(change == 'Shift to green') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope),binwidth=0.1) +
  theme_minimal() +
  labs(y='',x='') +
  xlim(-4,2.5)
h4


png('C:/PhD_code/LakeColor_SpatTem/Figures/Figure2/h4.png', height=4.5, width=6.5, units='in', res=500)
h4
dev.off()


library(patchwork)
h1/h2/h3/h4


ggsave(c1, 'Figures/Figure2/c1.png')


trend_change |>
  filter(change == 'Shift to green') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_violin(aes(lm_slope, '')) +
  theme_minimal() +
  labs(y='',x='')





