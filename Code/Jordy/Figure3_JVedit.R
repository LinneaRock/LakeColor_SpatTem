#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Script to create figure 3 #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# 1. Read in libraries, data, and set color schemes ####
library(tidyverse)
library(png)
library(grid)



# below is our finalized dataset saved to Beartooth on 2023-12-11
data <- read.csv('../2023-12-11_Temporal_Avg_LMs.csv') |> 
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

mup <- readPNG("LakeColor_SpatTem/maskup.png", native=FALSE)
mdown <- readPNG('LakeColor_SpatTem/maskdown.png', native = FALSE)
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
  geom_line(aes(year, Nat_avgdwl_year), linewidth=2) +
  theme_bw() +
  labs(x = '', y = '') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86', linewidth=2)  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=460) +
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.title=element_text(size=15), #change font size of all text
              axis.text.x = element_blank(),
              axis.title.y=element_blank(),
              panel.grid.minor = element_blank(), 
              panel.grid.major.x = element_blank(),
              plot.margin = margin(0.5,0.5, 0, 0, "cm"))+
        ylim(450,650)

# +
# these lines add text to the arrows (good for presentation, not for publication?)
  # annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
  # annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
  # annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c1

ggsave('Figure3/c1.png', height=3, width=5, units='in')



# plot lakes that shifted from green to blue
c2 <- trend_change |> 
  filter(change == 'Shift to blue') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year), linewidth=2) +
  theme_bw() +
  labs(x = '', y = '') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86', linewidth=2)  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=530, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=460) +
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.title=element_text(size=15), #change font size of all text
              axis.text.x = element_blank(),
              axis.title.y=element_blank(),
              panel.grid.minor = element_blank(), 
              panel.grid.major.x = element_blank(),
              plot.margin = margin(0.5,0.5, 0, 0, "cm"))+
        ylim(450,650)

# +
# these lines add text to the arrows (good for presentation, not for publication?)
# annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
# annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
# annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c2


ggsave('Figure3/c2.png', height=3, width=5, units='in')


## 4b. Blue to green lakes ####

# plot lakes that trended blue to greener, but did not change
c3 <- trend_no_change |> 
  filter(trend_cat == 'Blue -> Greener') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year), linewidth=2) +
  theme_bw() +
  labs(x = '', y = '') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86', linewidth=2)  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=510, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=545, ymax=460)+
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.title=element_text(size=15), #change font size of all text
              axis.text.x = element_blank(),
              axis.title.y=element_blank(),
              panel.grid.minor = element_blank(), 
              panel.grid.major.x = element_blank(),
              plot.margin = margin(0.5,0.5, 0, 0, "cm"))+
        ylim(450,650)

# +
# something fucking weird up with the arrows on this one 
# these lines add text to the arrows (good for presentation, not for publication?)
# annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
# annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
# annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c3

ggsave('Figure3/c3.png', height=3, width=5, units='in')


# plot lakes that shifted from blue to greener
c4 <- trend_change |> 
  filter(change== 'Shift to green') |>
  ggplot() +
  # plot individual trend lines
  geom_line(aes(year, avg_dwl_year, group = lagoslakeid), 
            color = 'grey', alpha= 0.25) +
  # add average trend line
  geom_line(aes(year, Nat_avgdwl_year), linewidth=2) +
  theme_bw() +
  labs(x = '', y = 'Dominant wavelength') +
  # add line for color shift threshold
  geom_hline(yintercept = 530, color = '#698c86', linewidth=2)  +
  # add arrows
  scale_x_continuous(expand = c(0,0)) +
  annotation_custom(rasterGrob(rmatbrown), xmin = -Inf, xmax=1990, ymin=515, ymax=600) +
  annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=545, ymax=460)+
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.title=element_text(size=15), #change font size of all text
              axis.title.y=element_blank(),
              axis.title.x=element_text(color="black",size=15),
              panel.grid.minor = element_blank(), 
              panel.grid.major.x = element_blank(),
              plot.margin = margin(0.5,0.5, 0, 0, "cm"))+
        labs(y = '', x = '') +
        ylim(450,650)

# +
# these lines add text to the arrows (good for presentation, not for publication?)
# annotate('text', x = 1987, hjust=0, y = 540, label = "green/\nbrown", size = 3, angle = 90) +
# annotation_custom(rasterGrob(rmatblue), xmin = -Inf, xmax=1990, ymin=530, ymax=450) +
# annotate('text', x = 1987, hjust = 0, y = 510, label = "blue", size = 3, angle = -90)
c4

ggsave('Figure3/c4.png', height=3, width=5, units='in')

# 5. Histograms of slopes in each category ####

# histogram for first figure above - trending green to blue, no change
q2 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Green -> Bluer'))$lm_slope, 0.5)

q1 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Green -> Bluer'))$lm_slope, 0.25)

q3 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Green -> Bluer'))$lm_slope, 0.75)

h1 <- trend_no_change |>
  filter(trend_cat == 'Green -> Bluer') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope), binwidth=0.05) +
        geom_vline(xintercept = 0, color = "black", linewidth=1.5) +
        geom_vline(xintercept = c(q1, q3), color = "#759e72", linetype = "dashed",linewidth=1.3) +
        geom_vline(xintercept =  q2, color = "#759e72",linewidth=1.7)+
        theme_bw() +
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.text.x = element_blank(),
              axis.ticks.x = element_line(),
              panel.grid.minor = element_blank(),
              panel.grid.major.x = element_blank())+
  labs(y='',x='') +
  xlim(-3, 2.5)
h1

ggsave('Figure3/h1.png', height=3, width=5.5, units='in')

# histogram for second figure above - shifted from green to blue
q2 <- quantile((trend_change |>
                  filter(change == 'Shift to blue'))$lm_slope, 0.5)

q1 <- quantile((trend_change |>
                  filter(change == 'Shift to blue'))$lm_slope, 0.25)

q3 <- quantile((trend_change |>
                  filter(change == 'Shift to blue'))$lm_slope, 0.75)

h2 <- trend_change |>
  filter(change == 'Shift to blue') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope), binwidth=0.05) +
        geom_vline(xintercept = 0, color = "black", linewidth=1.5) +
        geom_vline(xintercept = c(q1, q3), color = "#327cbb", linetype = "dashed", linewidth=1.3) +
        geom_vline(xintercept =  q2, color = "#327cbb",linewidth=1.7)+
        theme_bw() +
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.text.x = element_blank(),
              panel.grid.minor = element_blank(),
              panel.grid.major.x = element_blank())+
  labs(y='',x='') +
  xlim(-3,2.5)
h2

ggsave('Figure3/h2.png', height=3, width=5.5, units='in')




# histogram for first figure above - trending blue to green, no change
q2 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Blue -> Greener'))$lm_slope, 0.5)

q1 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Blue -> Greener'))$lm_slope, 0.25)

q3 <- quantile((trend_no_change |>
                  filter(trend_cat == 'Blue -> Greener'))$lm_slope, 0.75)

h3 <- trend_no_change |>
  filter(trend_cat == 'Blue -> Greener') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope),binwidth=0.05) +
        geom_vline(xintercept = 0, color = "black", linewidth=1.5) +
        geom_vline(xintercept = c(q1, q3), color = "#568f96", linetype = "dashed", linewidth=1.3) +
        geom_vline(xintercept =  q2, color = "#568f96",linewidth=1.7)+
        theme_bw() +
        theme(axis.text=element_text(color="black",size=15), # make all font black
              axis.text.x = element_blank(),
              panel.grid.minor = element_blank(),
              panel.grid.major.x = element_blank())+
  labs(y='',x='') +
  xlim(-3,2.5)
h3
ggsave('Figure3/h3.png', height=3, width=5.5, units='in')


# histogram for fourth figure above - shifted from blue to green
q2 <- quantile((trend_change |>
                  filter(change == 'Shift to green'))$lm_slope, 0.5)

q1 <- quantile((trend_change |>
                  filter(change == 'Shift to green'))$lm_slope, 0.25)

q3 <- quantile((trend_change |>
                  filter(change == 'Shift to green'))$lm_slope, 0.75)

h4 <- trend_change |>
  filter(change == 'Shift to green') |>
  select(lagoslakeid, lm_slope) |>
  distinct() |>
  ggplot() +
  geom_histogram(aes(lm_slope),binwidth=0.05) +
        geom_vline(xintercept = 0, color = "black", linewidth=1.5) +
        geom_vline(xintercept = c(q1, q3), color = "#94b660", linetype = "dashed", linewidth=1.3) +
        geom_vline(xintercept =  q2, color = "#94b660", linewidth=1.7)+
        theme_bw() +
        theme(axis.text=element_text(color="black",size=15), # make all font black
              panel.grid.minor = element_blank(), 
              panel.grid.major.x = element_blank(),
              axis.title.x=element_text(color="black",size=15)) +
        labs(y='',x='') +
  xlim(-3,2.5)
h4

ggsave('Figure3/h4.png', height=3, width=5.5, units='in')


# library(patchwork)
# h1/h2/h3/h4
# 
# 
# 
# 
# ggsave('Figure3/hists.png', height=6, width =3, units='in', dpi=1200)






