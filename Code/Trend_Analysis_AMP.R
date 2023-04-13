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

# Read in masterDF
### Ashleigh, UNCOMMENT THIS IF STARTING ANEW 
#source("Data/Call_data.R")

# Restrict the data to Julian day 152- 258 (June 1 - Sep 15)
source("Code/temporal_restriction.R")
#Filter out lakes with less than 3 observations


source("Code/fui_scripts.R")

site_cols <- temporal_med %>%
  mutate(dWL = round(ann_dWL,0)) %>%
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
  zyp::zyp.sen(impute_value ~ year, df)
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
  left_join(.,site_cols %>%
              select(lagoslakeid,group)) %>%
  mutate(
    Trend = case_when(
      p.value <= 0.05 & slope >= 0 & early_mean < 530 ~ 'Blue -> Greener',
      p.value <= 0.05 & slope >= 0 & early_mean >= 530 ~ 'Intensifying Green/brown',
      p.value <= 0.05 & slope <= 0 & early_mean > 530 ~ 'Green -> Bluer',
      p.value <= 0.05 & slope <= 0 & early_mean < 530 ~ 'Intensifying Blue',
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



