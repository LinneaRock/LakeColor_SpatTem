######################################################################
#Script to explore lake color on the updated  western LimnoSat dataset
######################################################################
# Goal = understand how color of small lakes changes through time
# Approach - repeat analyses conducted by Oleksy et al (2022)
# Article reference: https://iopscience.iop.org/article/10.1088/1748-9326/ac939c/pdf
# GitHub reference: https://github.com/bellaoleksy/rocky-mtn-color

### Trend analysis
library(tidyverse)
library(purrr)
library(broom)
library(trend)
library(zyp)
library(patchwork)

# Read in masterDF
### Ashleigh, UNCOMMENT THIS IF STARTING ANEW 
source("Data/Call_data.R")

# Restrict the data to Julian day 152- 258 (June 1 - Sep 15)
source("Code/temporal_restriction.R")
#Filter out lakes with less than 3 observations


source("Code/fui_scripts.R")

# site_cols <- temporal_med %>%
#   mutate(dWL = round(ann_dWL,0)) %>%
#   inner_join(fui.lookup) %>%
#   inner_join(fui.colors) %>%
#   mutate(group = cut(ann_dWL, 
#                      breaks = c(0,530,Inf), 
#                      labels = c('Blue', #blue/clear
#                                 'Green'))) #green/brown/murky

site_cols_modern <- temporal_med %>%
  filter(year >= 2005 ) %>%  
  group_by(lagoslakeid) %>% 
  summarise(ann_dWL = median(ann_dWL)) %>% 
  mutate(ann_dWL = round(ann_dWL,0)) %>% 
  inner_join(fui.lookup) %>%
  inner_join(fui.colors) %>%
  mutate(group = cut(ann_dWL, 
                     breaks = c(0,530,Inf), 
                     labels = c('Blue', #blue/clear
                                'Green'))) #green/brown/murky



##FUNCTIONS FOR SENS SLOPE ANALYSES 

map_sens <- function(df) {
  sens.slope(df$ann_dWL)
}


#https://kevintshoemaker.github.io/NRES-746/TimeSeries_all.html
#For getting sens intercept, helpful for plotting later
map_zyp <- function(df) {
  zyp::zyp.sen(ann_dWL ~ year, df)
}


sens_intercept <- function(mod) {
  mod$coefficients[[1]] # pull out y-int estimate for ploting
}


sens_est <- function(mod) {
  mod$estimates[[1]] #slope estimate
}

val_mean <- function(df) {
  early_mean <- df %>%
    filter(year < 2005) %>% #Might want to change the year. What is the halfway point of the timeseries? 
    pull(ann_dWL) %>%
    median(., na.rm = T)
}

trends_nested <- temporal_med %>%
  group_by(lagoslakeid) %>%
  nest() %>%
  mutate(
    sens = map(data, map_sens),
    sens_sum = map(sens, broom::glance),
    slope = map(sens, sens_est),
    zyp_mod = map(data, map_zyp),
    intercept = map(zyp_mod, sens_intercept),
    early_mean = map(data, val_mean)
  )



##Summarize the trends
trends_summary = unnest(trends_nested, c(sens_sum, slope, early_mean)) %>%
  left_join(.,site_cols_modern %>%
              select(lagoslakeid,group)) %>%
  mutate(
    Trend = case_when(
      p.value <= 0.05 & slope >= 0 & early_mean < 530 ~ 'Blue -> Greener',
      p.value <= 0.05 & slope >= 0 & early_mean >= 530 ~ 'Intensifying Green/brown',
      p.value <= 0.05 & slope <= 0 & early_mean > 530 ~ 'Green -> Bluer',
      p.value <= 0.05 & slope <= 0 & early_mean <= 530 ~ 'Intensifying Blue',
      p.value > 0.05 ~ 'No trend'
    ),
    Trend = factor(
      Trend,
      levels = c(
        'No trend',
        'Intensifying Blue',
        'Green -> Bluer',
        'Intensifying Green/brown',
        'Blue -> Greener'
      )
    )
  ) %>%
  mutate(
    Mode_change = case_when(Trend == "Blue -> Greener" & group == "Green/brown" ~ "Change to Green/brown",
                            Trend == "Green -> Bluer" & group == "Blue" ~ "Change to Blue",
                            TRUE ~ "No net change")
  )


#Create master df for plotting
dWL_all <- trends_summary %>% 
  unnest(data) %>% 
  unnest(intercept) 

saveRDS(dWL_all, 'Data/dwl_all.RDS')

# Recrreate Oleksy et al (2022) Figure 3

### Figure 3. DWL Trend examples

set.seed(123654)


dwl_specials <- dWL_all %>%
  filter(abs(slope) >= 1 &
           p.value < 0.05) %>% #I think it would be better to not show a trend line for "No Trend"
  group_by(Trend) %>%
  slice(which.max(ann_dWL)) %>%
  pull(lagoslakeid )
full_spec <- dWL_all %>%
  filter(lagoslakeid  %in% dwl_specials)


#How many lakes in each trend category?
trend_labels <- dWL_all %>%
  group_by(Trend) %>%
  summarize(n = length(unique(lagoslakeid))) %>%
  mutate(perc = (n / sum(n)) * 100,
         perc = round(perc, 0)) 

trendColors <- c(
  'No trend' = 'grey90',
  'Intensifying Blue' = '#1f78b4',
  'Green -> Bluer' = '#a6cee3',
  'Intensifying Green/brown' = '#33a02c',
  'Blue -> Greener' = '#b2df8a'
)

#Export
png(filename = 'Figures/Figure3.Trend Examples_updated.png',
    width = 5,
    height = 8,
    res = 600,
    units = 'in')


ggplot(dWL_all, aes(x = year, y = ann_dWL, group = lagoslakeid)) +
  geom_abline(aes(intercept = intercept, slope = slope), color="grey50", size=0.1, alpha=0.5) + #background Sen's slopes
  geom_abline(data = full_spec, 
              aes(intercept = intercept, slope = slope, color=Trend),
              size=1) + #Sen's slope for selected sites
  geom_point(data = full_spec, aes(fill=Trend), shape=21) + 
  scale_fill_manual(values=trendColors)+
  scale_color_manual(values=trendColors)+
  geom_text(x = 1990, y = 585,
            aes(group=Trend, label = paste("n =",n,";",perc,"%")),
            color="black",
            data = trend_labels, size=3)+ #Add label for sample size
  scale_x_continuous(breaks=seq(1986, 2018, 6))+
  scale_y_continuous(breaks=seq(500, 575, 25))+
  facet_wrap(~Trend, nrow=5) + 
  theme_classic()+
  theme(legend.position="none",
        plot.margin = unit(c(0,0.2,0,0), "cm"),)+
  labs(y="Dominant wavelength (nm)",
       x="Year") 
  
  ggplot(dWL_all %>%
           distinct(lagoslakeid,.keep_all = T),aes(x=slope,color=Trend)) + 
  geom_freqpoly(bins = 20, size = 1) + 
  geom_vline(xintercept=0, linetype="dashed", size=0.5)+
  facet_wrap(~Trend, nrow=5, scales="free_y") +
  theme_classic() + 
  scale_y_continuous(position="right")+
  scale_x_continuous(breaks=seq(-1.5, 1.5, 1))+
  theme(legend.position="none",
        plot.margin = unit(c(0,0,0,0.2), "cm"),
        strip.text.x = element_text(color="white"), #Keep strips but color white so they are invisible
        legend.direction = 'horizontal') +
  scale_color_manual(values=trendColors)+
  xlab("Slope")+
  ylab('Lake count') + 
  plot_layout(widths = c(1, 0.6))

dev.off()



## Investigate why there are NAs in the dataframe
investNA <- dWL_all %>% 
  filter(is.na(Trend))

unique(investNA$lagoslakeid)
