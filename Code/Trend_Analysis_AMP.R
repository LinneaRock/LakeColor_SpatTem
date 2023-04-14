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
library(ggthemes)
library(gt)

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

#saveRDS(dWL_all, 'Data/dwl_all.RDS')

# Recrreate Oleksy et al (2022) Figure 3

### Figure 3. DWL Trend examples

set.seed(1236543)


dwl_specials <- dWL_all %>%
  filter(abs(slope) >= 0.7 &
           p.value < 0.05) %>% #I think it would be better to not show a trend line for "No Trend"
  # Try other pvalues to select slightly different lake for plotting; original p.value <= 0.05
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
  # Next chunk is meant to add the regression line across the plot - not currently working correctly
  # geom_abline(data = full_spec,
  #             aes(intercept = intercept, slope = slope, color=Trend),
  #             size=1) + #Sen's slope for selected sites
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
  theme_few()+
  theme(legend.position="none",
        plot.margin = unit(c(0,0.2,0,0), "cm"),)+
  labs(y="Dominant wavelength (nm)",
       x="Year") +
  
  ggplot(dWL_all %>%
           distinct(lagoslakeid,.keep_all = T),aes(x=slope,color=Trend)) + 
  geom_freqpoly(bins = 20, size = 1) + 
  geom_vline(xintercept=0, linetype="dashed", size=0.5)+
  facet_wrap(~Trend, nrow=5, scales="free_y") +
  theme_few() + 
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

# Within the categories - which have slope that leads to change in greater than 5 over the record
# how many lakes within the categories have a fairly substantial change
# 5 nm detectable with human eye
# table - 
#statistically significant change
# ecologically meaningful

study_period <- range(dWL_all$year)
len_study_period = abs(study_period[1] - study_period[2])

# Define ecologically signficant change as greater than 5 nm change over length of study period
# Calculate minimum slope necessary to reach this
min_ecoSig_slope_studyPeriod  = (len_study_period/5) 
min_ecoSig_slope_year  = min_ecoSig_slope_studyPeriod / len_study_period

# Make dataframe with average slope over entire study period
dWL_all_studyPeriod <- dWL_all %>% 
  select(lagoslakeid, group, Trend, slope) %>% 
  distinct(slope, Trend, group) %>% 
  mutate(study_period_slope = slope*len_study_period) %>% 
  mutate(ecologically_sig = case_when(study_period_slope >= 5 ~ "yes", .default = "no"))

# Create df for table to summarize number of lakes by category that are stat sig vs ecologically significant 
sig_comparison_table <- dWL_all_studyPeriod %>% 
  #filter(ecologically_sig == 'yes') %>% 
  group_by(Trend, ecologically_sig) %>% 
  count()

sig_comparison_table <- dWL_all_studyPeriod %>% 
  ungroup() %>% 
  count(Trend, ecologically_sig) %>%
  group_by(Trend) %>%
  mutate(sum=sum(n)) %>%
  group_by(Trend, ecologically_sig, sum, n) %>%
  summarize(perc = (n/sum)* 100) %>% 
  pivot_wider(names_from = ecologically_sig, values_from = c(n, perc)) #pivot wider for easier viewing

sig_comparison_table_df <- as.data.frame(sig_comparison_table) %>% 
  rename(Total = sum) 

sig_comparison_table_df$No = paste0(round(sig_comparison_table_df$perc_no, 2), "% (", sig_comparison_table_df$n_no, ")")
sig_comparison_table_df$Yes = paste0(round(sig_comparison_table_df$perc_yes, 2), "% (", sig_comparison_table_df$n_yes, ")")
sig_comparison_table_df <- sig_comparison_table_df %>% 
  select(Trend, No, Yes)

# Make table
eco_sig_table <- gt(sig_comparison_table_df) %>% 
  tab_header(
    title = "Ecologically Significant Changes in Lake Color") %>% 
  cols_align(align = "left") %>% 
  tab_style(
    style = cell_fill(color = 'grey90',),
    locations = cells_body(rows = Trend ==  'No trend')
  ) %>% 
  tab_style(
    style = cell_fill(color = '#1f78b4',),
    locations = cells_body(rows = Trend ==  'Intensifying Blue')
  ) %>% 
  tab_style(
    style = cell_fill(color = '#a6cee3',),
    locations = cells_body(rows = Trend ==  'Green -> Bluer')
  ) %>% 
  tab_style(
    style = cell_fill(color = '#33a02c',),
    locations = cells_body(rows = Trend ==  'Intensifying Green/brown')
  ) %>% 
  tab_style(
    style = cell_fill(color = '#b2df8a',),
    locations = cells_body(rows = Trend ==  'Blue -> Greener')
  ) 
eco_sig_table

# 
# #Export
# png(filename = 'Figures/EcologicallySignficantChangesLakeColor.png',
#     width = 4,
#     height = 3,
#     res = 600,
#     units = 'in')
# 
# eco_sig_table
# 
# dev.off()

