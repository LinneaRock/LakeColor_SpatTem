### Trend analysis
library(tidyverse)
library(purrr)
library(broom)

source("Code/fui_scripts.R")

site_cols <- limnoSat %>%
  mutate(dWL = round(dWL,0)) %>%
  inner_join(fui.lookup) %>%
  inner_join(fui.colors) %>%
  mutate(group = cut(dWL, 
                     breaks = c(0,530,Inf), 
                     labels = c('Blue', #blue/clear
                                'Green'))) #green/brown/murky



##FUNCTIONS FOR SENS SLOPE ANALYSES 

map_sens <- function(df) {
  sens.slope(df$impute_value)
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
    pull(dWL) %>%
    median(., na.rm = T)
}

trends_nested <- DF_NAME %>%
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
  
  

